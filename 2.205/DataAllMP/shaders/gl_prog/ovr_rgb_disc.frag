smooth in vec3 outPosL;

uniform vec4 inTint;
uniform vec4 inTime;
uniform vec4 inWindow;

layout (location = 0) out vec4 finalCol0;

void main()
{
	float ring = length(vec2(outPosL.x, outPosL.z));	// Where on the ring are we?
	float ringFade = pow(max(0.0, 1.0-(ring*1.1)), 0.75);			// Fade at distance...
	float pulseLoc = (fract(inTime.x/3.0)*1.2)-0.1;	// -0.1->1.1	// Where is the pulse?
	
	float pulseRel = pulseLoc-ring;
	if (pulseRel < 0.0)
	{
		pulseRel *= -3.0;
	}
	float pulseDeg = pow(1.0-clamp(pulseRel/0.02f, 0.0, 1.0), 0.25);
	
	float bumpRel = pulseLoc-ring;
	if (bumpRel < 0.0)
	{
		bumpRel *= -10.0;
	}
	float bumpDeg = pow(1.0-clamp(bumpRel/0.075f, 0.0, 1.0), 0.5);
	float bump = pow(abs(1.0-(fract((ring*19.5)-0.35)*2.0)), 8.0)*bumpDeg;
	
	float pulseDark = 1.0-(pulseDeg*0.2);
	float pulseGlow = pow(pulseDeg, 5.0);
	
	float fxFade = 0.35;
	
	pulseDark = mix(1.0, pulseDark, ringFade);
	pulseDark += (1.0-ring)*0.25;
	
	pulseGlow = mix(0.0, pulseGlow, ringFade);
	pulseGlow += bump*ringFade;
	pulseGlow *= fxFade;
	
	vec4 pulseMul = vec4(pulseDark, pulseDark, pulseDark, 1.0);
	vec4 pulseAdd = vec4(pulseGlow*inTint.x, pulseGlow*inTint.y, pulseGlow*inTint.z, 0.0);
	
	finalCol0 = (inTint*pulseMul)+pulseAdd;
}
