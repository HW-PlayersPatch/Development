#version 330

smooth in vec4 outCol0;
smooth in vec2 outUV0;

uniform sampler2D inTex;

layout (location = 0) out vec4 finalCol0;

void main(void) { 
	finalCol0 = texture(inTex, outUV0)*outCol0;
}
