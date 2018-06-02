smooth in vec4 outCol0;

uniform vec4 inFade;
uniform vec4 inAddLight;

layout (location = 0) out vec4 finalCol0;

void main()
{
	finalCol0 = ((2.0*outCol0)+inAddLight)*inFade*getBackExp();
}
