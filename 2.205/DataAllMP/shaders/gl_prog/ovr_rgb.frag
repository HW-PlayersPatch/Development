#version 330

uniform vec4 inTint;

layout (location = 0) out vec4 finalCol0;

void main()
{
	finalCol0 = inTint;
}
