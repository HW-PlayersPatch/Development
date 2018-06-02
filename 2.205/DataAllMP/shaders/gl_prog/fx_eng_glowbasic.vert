#version 330

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

smooth out vec3 outFade;
smooth out vec3 outNorm_W;
smooth out vec3 outEye_W;

void main()
{
	mat4 MV4 = inMatV*inMatM;
	mat4 MVP = inMatP*MV4;
	vec4 pos4 = vec4(inPos, 1.0f);
	
	mat4 invV = inverse(inMatV);
	vec3 pos_W = (inMatM*pos4).xyz;
	
	outEye_W = pos_W-invV[3].xyz;	// World-space for reflections/etc
	outNorm_W = mat3(inMatM)*inNorm.xyz;
	
	outFade = inPos.xyz;
	
	gl_Position = MVP*pos4;			// Clip-space vert for geo/rasterize	
}