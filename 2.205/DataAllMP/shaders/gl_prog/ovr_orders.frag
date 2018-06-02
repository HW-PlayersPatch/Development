#version 330

smooth in vec4 outCol0;

layout (location = 0) out vec4 finalCol0;

void main(void) { 
	finalCol0 = outCol0;
}
