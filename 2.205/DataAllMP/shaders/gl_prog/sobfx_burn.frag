smooth in vec2 outUV0;
smooth in vec2 outUV1;
smooth in vec2 outUV2;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

uniform vec4 inTime;

uniform sampler2D inTexGlow;
uniform sampler2D inTexSpec;
uniform sampler2D inTexMask;

uniform vec4 inSOBParams;

uniform vec4 inFogColor;
uniform vec4 inFogWindow;

uniform mat4 inMatM;
uniform vec4 inColTeam;
uniform vec4 inColStripe;

uniform vec4 inGammaScale;

#ifdef PATCH_ALTHYPER
	smooth in float outClipD;
#endif

layout (location = 0) out vec4 finalCol0;

void main()
{
#ifdef PATCH_ALTHYPER
	if (outClipD <= 0.0)
	{
		discard;
	}
#endif

	vec4 texGlow = texture(inTexGlow, outUV0);
	vec4 texSpec = texture(inTexSpec, outUV0);
	vec4 texMask = texture(inTexMask, outUV1);
	
	float glowDeg = (texGlow.x+texGlow.y+texGlow.z)*texMask.a;
	
	if (glowDeg <= 0.0)
	{
		discard;
	}
		
	vec4 paint = texGlow;
	paint.a = texMask.a*inSOBParams.x*inGammaScale.a;
	
	float age = inTime.z-outUV2.x;	// Now vs birth
	float lifespan = 0.1+(texSpec.b*texSpec.b*60.0);
	float decay = 1.0-clamp(age/lifespan, 0.0, 1.0);
	float retain = texSpec.a+((1.0-texSpec.a)*decay);
	
	vec3 noisePos = vec3((outPos_W.x*0.1)+(inTime.x*0.4), (outPos_W.y*0.11)-(inTime.x*0.41), (outPos_W.z*0.09)-(inTime.x*0.36));
	float glowNoise = HELP_Noise3(noisePos);
	glowNoise = abs(fract(glowNoise+(inTime.x*0.371))*2.0-1.0)*0.5+0.75;
	glowNoise = mix(1.0, glowNoise, texGlow.a);		// 0 glow.a = no noise
	paint.rgb *= glowNoise*retain;
	
	float maxFog = inFogColor.a*inFogColor.w;
	if (maxFog > 0.0)
	{
		float worldDist = length(outEye_W);
		float useFog = clamp((worldDist-inFogWindow.x)/(inFogWindow.z-inFogWindow.x), inFogWindow.y, inFogWindow.w);
		paint.a = mix(paint.a, 0.0, useFog*inFogColor.a);
	}
	
	paint *= getShipExp();
	
	finalCol0 = paint;
}
