smooth in vec2 outUV0;

uniform sampler2D inTexBG;

uniform vec4 inFade;
uniform vec4 inAddLight;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 texBG = texture(inTexBG, outUV0);
	finalCol0 = ((texBG)+inAddLight)*inFade*getBackExp();
}
