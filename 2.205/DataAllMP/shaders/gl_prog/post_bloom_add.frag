#version 330

smooth in vec2 outUV0;

uniform sampler2D inTexColor;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	finalCol0 = texture(inTexColor, outUV0);
}