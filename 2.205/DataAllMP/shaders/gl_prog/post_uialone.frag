#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexUI;

uniform vec4 inMouse;
uniform vec4 inWindow;
uniform vec4 inDepth;
uniform vec3 inLens;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 tex0 = texture(inTexUI, outUV0);
	finalCol0 = tex0;
	//finalCol0.g = 0.5;
}
