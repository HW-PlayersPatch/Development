smooth in vec2 outUV0;
smooth in vec4 outPosW;

uniform sampler2D inTex0;
uniform vec4 inTint;
uniform vec4 inTime;
uniform vec4 inWindow;

layout (location = 0) out vec4 finalCol0;

void main()
{
	float mulTint = 1.0;

	vec2 windowUV = gl_FragCoord.xy*inWindow.zw;
	float scanLine = (windowUV.y*17.0f)+windowUV.x*0.01;
	
	float flicker = fract((inTime.x+scanLine)*330.072)+fract((inTime.x+(scanLine*3))*371.48);
	flicker = min(1.0, pow(flicker*0.75, 9.0));
	
	float centerX = 1.0-abs(1.0-(windowUV.x*2.0));
	centerX = pow(centerX, 0.75)*(0.8+(flicker*0.4));
	mulTint = mix(0.5, 1.0, min(1.2, centerX));
	
	vec4 finalOut = texture(inTex0, outUV0)*inTint*vec4(mulTint, mulTint, mulTint, 1.0);
	finalOut.a *= 0.8+(flicker*0.2);

	finalCol0 = finalOut;
}
