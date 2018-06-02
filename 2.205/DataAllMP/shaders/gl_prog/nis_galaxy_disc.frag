smooth in vec2 outUV0;

uniform vec4 inTime;
uniform vec4 inTrigger;
uniform float inTimeScale;
uniform float inTimeDelay;

uniform vec4 inMatScale;

uniform sampler2D inTexDisc;
uniform sampler2D inTexMasks;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 texDisc = texture(inTexDisc, outUV0);
	vec4 texMasks = texture(inTexMasks, outUV0);
	vec4 texOut = texDisc;
	
	float nowTime = inTimeScale*((inTime.z-inTrigger.z)-inTimeDelay);
	
#ifdef GALAXY_GLOW
	float mulLum = inMatScale.x;
	float texLum = (texOut.x*0.299)+(texOut.y*0.587)+(texOut.z*0.114);
	float lumWindow = inMatScale.w-inMatScale.z;
	
	if (texLum < inMatScale.z)
	{
		mulLum *= clamp((texLum-(inMatScale.z-lumWindow))/lumWindow, 0.0, 1.0);
	}
	else if (texLum > inMatScale.w)
	{
		mulLum *= clamp(((inMatScale.w+lumWindow)-texLum)/lumWindow, 0.0, 1.0);
	}

	float fadeDeg = clamp((nowTime-1.0)/5.0, 0.0, 1.0);
	fadeDeg = pow(fadeDeg, 2.0/(texOut.r+0.00001));
	texOut.a = clamp(texMasks.g-(1.0-fadeDeg), 0.0, 1.0)*mulLum;
#endif

#ifdef GALAXY_DARK
	float fadeIntro = clamp(nowTime/0.5, 0.0, 1.0);
	float fadeDeg = clamp(nowTime/5.0, 0.0, 1.0);
	fadeDeg = (1.0-pow(fadeDeg, 3.0))*0.9;
	
	float fadeAlpha = clamp((texMasks.r-fadeDeg)/(1.0-fadeDeg), 0.0, 1.0);
	
	texOut = vec4(0.0, 0.0, 0.0, fadeAlpha*fadeIntro);
#endif
		
	finalCol0 = texOut;
}
