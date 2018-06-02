#version 330

uniform vec4 inColEffect;

layout (location = 0) out vec4 finalCol0;

void main()
{
	finalCol0 = inColEffect;
}
