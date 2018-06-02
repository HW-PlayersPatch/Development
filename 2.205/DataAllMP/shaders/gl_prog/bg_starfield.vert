#version 330

layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatMV;
uniform mat4 inMatP;

uniform float inScale;

smooth out vec4 outCol0;
smooth out vec2 outUV0;

void main()
{
	mat4 PVM = inMatP*inMatMV;
	
	vec3 ofsV = inPos-inNorm;
	ofsV *= inScale;
	ofsV += inNorm;
    
	gl_Position = PVM*vec4(ofsV.x, ofsV.y, ofsV.z, 1.0f);
	outCol0 = vec4(inCol0.r*2.0, inCol0.g*2.0, inCol0.b*2.0, inCol0.a);
	outUV0 = inUV0;
}
