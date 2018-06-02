#version 330

smooth in vec2 outUV0;
smooth in vec4 outCol0;

uniform sampler2D inTex;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 tex0 = texture(inTex, outUV0);
	finalCol0 = tex0*outCol0;
}
