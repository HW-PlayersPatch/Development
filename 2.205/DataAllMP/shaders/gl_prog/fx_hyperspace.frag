#version 330

smooth in vec4 outCol0;
smooth in vec2 outUV0;

uniform sampler2D inTexHyper;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 hyperTex = texture(inTexHyper, outUV0);
	vec4 hyperCol = hyperTex*outCol0*2.0;
	finalCol0 = hyperCol;
}
