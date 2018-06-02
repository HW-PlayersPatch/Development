#version 330

layout (location = 0) in vec4 inPos;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatMV;
uniform mat4 inMatP;
uniform mat4 inMatC;
uniform mat4 inMatCP;
uniform mat4 inMatLC;
uniform mat4 inMatLCP;

smooth out vec2 outUV0;
smooth out vec2 outUV1;
smooth out mat4 outLCMat;
smooth out mat4 outInvC;

void main()
{
	mat4 PVM = inMatP*inMatMV;
	gl_Position = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	
	outLCMat = inMatLCP*inMatLC;
	outInvC = inverse(inMatCP*inMatC);
	
	outUV0 = inUV0;
	outUV1 = inUV1;
}
