#version 330

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

smooth out float outZ;
smooth out vec2 outUV0;
smooth out vec3 outNorm_W;
smooth out vec3 outPos_W;

void main()
{
	vec4 posW4 = inMatM*vec4(inPos, 1.0);
	outPos_W = posW4.xyz;
	
	vec4 posZ = inMatV*posW4;
	outZ = posZ.z;
	
	vec4 normW4 = inMatM*vec4(inNorm, 0.0);
	outNorm_W = normW4.xyz;
	
	outUV0 = inUV0;
	
	mat4 VP = inMatP*inMatV;
	gl_Position = VP*posW4;			// Clip-space vert for geo/rasterize	
}
