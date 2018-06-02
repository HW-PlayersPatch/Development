#version 330

layout (location = 0) in vec3 inPos;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatV;
uniform mat4 inMatP;

smooth out vec4 outCol0;
smooth out vec2 outUV0;

void main()
{
	mat4 VP = inMatP*inMatV;
	gl_Position = VP*vec4(inPos, 1.0);
	
	outCol0 = inCol0;
	outUV0 = inUV0;
}