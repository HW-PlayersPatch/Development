#version 330

layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatP;

smooth out vec4 outCol0;
smooth out vec2 outUV0;

void main()
{
	gl_Position = inMatP*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	outCol0 = inCol0;
	outUV0 = inUV0;
}
