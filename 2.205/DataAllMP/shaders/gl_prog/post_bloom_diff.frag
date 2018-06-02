#version 330

smooth in vec2 outUV0;

uniform sampler2D inTexSharp;
uniform sampler2D inTexAvg;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	finalCol0 = max(vec4(0.0), texture(inTexSharp, outUV0)*texture(inTexAvg, outUV0));
}