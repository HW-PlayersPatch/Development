#version 330

smooth in vec2 outUV0;

uniform sampler2D inTex0;

layout (location = 0) out vec4 finalCol0;

void main()
{
	finalCol0 = texture(inTex0, outUV0);
}
