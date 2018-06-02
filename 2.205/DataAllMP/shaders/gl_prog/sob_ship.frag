smooth in vec2 outUV0;
smooth in vec3 outNorm;
smooth in vec3 outTan;
smooth in vec3 outBiNorm;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

#ifdef SOB_SHADOWS_ON
	smooth in vec3 outPos_KL;
	uniform sampler2DShadow inTexShadow;
	uniform vec4 inShadowTrans[4];
	#ifdef SOB_SHADOWS_DUAL
		smooth in vec3 outPos_FL;
	#endif
#endif

uniform vec4 inTime;

#ifdef SOB_BADGE
smooth in vec2 outUV1;
uniform sampler2D inTexBadge;
#endif

#ifdef SOB_THRUSTERS
uniform sampler2D inTexDiffOn;
uniform sampler2D inTexGlowOn;
uniform sampler2D inTexDiffOff;
uniform sampler2D inTexGlowOff;
uniform vec4 inColEngine;
#else
uniform sampler2D inTexDiff;
uniform sampler2D inTexGlow;
#ifdef SOB_GLOWRGB
uniform sampler2D inTexSpec;
#endif
#endif

#ifdef SOB_RESOURCE
uniform sampler2D inTexProgress;
uniform vec2 inFadeInfo;
uniform vec3 inFadeWindow;
uniform vec4 inGlowStyle;

#ifdef SOB_DUALINPUT
uniform vec4 inMulDiff0;
uniform vec4 inMulDiff1;
uniform vec4 inMulGlow0;
uniform vec4 inMulGlow1;
uniform vec4 inMulSpec0;
uniform vec4 inMulSpec1;
smooth in vec2 outUV_Diff0;
smooth in vec2 outUV_Glow0;
smooth in vec2 outUV_Spec0;
smooth in vec2 outUV_Norm0;
smooth in vec2 outUV_Diff1;
smooth in vec2 outUV_Glow1;
smooth in vec2 outUV_Spec1;
smooth in vec2 outUV_Norm1;
#endif

#ifdef SOB_DEBRIS
uniform vec4 inFXInfo[2];
#endif

#endif

#ifdef SOB_TEAMTEX
uniform sampler2D inTexTeam;
#endif

uniform sampler2D inTexNorm;
uniform samplerCube inTexEnv0;
uniform samplerCube inTexEnv1;

#ifdef SOB_USECLIP
	uniform vec4 inClipPlane;

	#ifdef PATCH_ALTHYPER
		smooth in float outClipD;
	#endif
#endif

uniform vec4 inSOBParams;
uniform vec4 inLifeParams;

uniform vec4 inFogColor;
uniform vec4 inFogWindow;

uniform mat4 inMatM;

#ifdef SOB_TEAM
uniform vec4 inColTeam;
uniform vec4 inColStripe;
#endif

#ifndef SOB_DEBRIS
uniform vec4 inColEffect;
#endif

uniform vec4 inSurfDiff;
uniform vec4 inSurfGlow;
uniform vec4 inSurfSpec;
uniform	vec4 inSurfGloss;
uniform vec4 inSurfRefl;
uniform vec4 inSurfFren;
uniform vec4 inSurfPaint;
uniform vec4 inSurfPeak;

uniform vec4 inPaintStyle;

uniform vec4 inGammaScale;
uniform vec4 inBGAddLight;
uniform vec4 inBGEnvParams;

#ifdef SOB_BAYLIGHT

	uniform vec4 inBayExps;	//br, bR, Br, BR

	#ifdef SOB_POST_B0R0
	vec4 getBayExp(){ return vec4(inBayExps.x, inBayExps.x, inBayExps.x, 1.0f); }
	#endif

	#ifdef SOB_POST_B0R1
	vec4 getBayExp(){ return vec4(inBayExps.y, inBayExps.y, inBayExps.y, 1.0f); }
	#endif

	#ifdef SOB_POST_B1R0
	vec4 getBayExp(){ return vec4(inBayExps.z, inBayExps.z, inBayExps.z, 1.0f); }
	#endif

	#ifdef SOB_POST_B1R1
	vec4 getBayExp(){ return vec4(inBayExps.w, inBayExps.w, inBayExps.w, 1.0f); }
	#endif
#endif

uniform ivec2 inLightCounts;
uniform vec4 inLightShip[96];	// Pos/Diff/Spec (or just Pos/Diff) + attenuations in W
uniform vec4 inLightCore[7];

layout (location = 0) out vec4 finalCol0;

#ifdef SOB_SHADOWS_ON

ivec2 shadWH = textureSize(inTexShadow, 0);
vec2 invShad = vec2(1.0/shadWH.x, 1.0/shadWH.y);

float CALC_ShadowMask(float blend, vec3 baseUVW){
#ifdef SOB_SHADOWS_HQ
	if (blend > 0.0)
	{
		vec2 texelUV = baseUVW.xy*shadWH;
		vec2 baseUV = vec2(floor(texelUV.x+0.5), floor(texelUV.y+0.5));
		float s = texelUV.x+0.5-baseUV.x;
		float t = texelUV.y+0.5-baseUV.y;
		baseUV -= vec2(0.5);
		baseUV *= invShad;
		
#define SOB_SHADOWS_3X3 1
#ifdef SOB_SHADOWS_3X3
		float uw0 = (3 - 2 * s);
		float uw1 = (1 + 2 * s);

		float u0 = ((2 - s) / uw0 - 1)*invShad.x;
		float u1 = (s / uw1 + 1)*invShad.x;

		float vw0 = (3 - 2 * t);
		float vw1 = (1 + 2 * t);

		float v0 = ((2 - t) / vw0 - 1)*invShad.y;
		float v1 = (t / vw1 + 1)*invShad.y;
			
		float total = 0.0;
		
		total += uw0*vw0*texture(inTexShadow, vec3(baseUV.x+u0, baseUV.y+v0, baseUVW.z));
		total += uw1*vw0*texture(inTexShadow, vec3(baseUV.x+u1, baseUV.y+v0, baseUVW.z));
		total += uw0*vw1*texture(inTexShadow, vec3(baseUV.x+u0, baseUV.y+v1, baseUVW.z));
		total += uw1*vw1*texture(inTexShadow, vec3(baseUV.x+u1, baseUV.y+v1, baseUVW.z));
		
		total /= 16.0;
#else
		float uw0 = (4 - 3 * s);
		float uw1 = 7;
		float uw2 = (1 + 3 * s);

		float u0 = ((3 - 2 * s) / uw0 - 2)*invShad.x;
		float u1 = ((3 + s) / uw1)*invShad.x;
		float u2 = (s / uw2 + 2)*invShad.x;

		float vw0 = (4 - 3 * t);
		float vw1 = 7;
		float vw2 = (1 + 3 * t);

		float v0 = ((3 - 2 * t) / vw0 - 2)*invShad.y;
		float v1 = ((3 + t) / vw1)*invShad.y;
		float v2 = (t / vw2 + 2)*invShad.y;
		
		float total = 0.0;
		
		total += uw0*vw0*texture(inTexShadow, vec3(baseUV.x+u0, baseUV.y+v0, baseUVW.z));
		total += uw1*vw0*texture(inTexShadow, vec3(baseUV.x+u1, baseUV.y+v0, baseUVW.z));
		total += uw2*vw0*texture(inTexShadow, vec3(baseUV.x+u2, baseUV.y+v0, baseUVW.z));
		total += uw0*vw1*texture(inTexShadow, vec3(baseUV.x+u0, baseUV.y+v1, baseUVW.z));
		total += uw1*vw1*texture(inTexShadow, vec3(baseUV.x+u1, baseUV.y+v1, baseUVW.z));
		total += uw2*vw1*texture(inTexShadow, vec3(baseUV.x+u2, baseUV.y+v1, baseUVW.z));
		total += uw0*vw2*texture(inTexShadow, vec3(baseUV.x+u0, baseUV.y+v2, baseUVW.z));
		total += uw1*vw2*texture(inTexShadow, vec3(baseUV.x+u1, baseUV.y+v2, baseUVW.z));
		total += uw2*vw2*texture(inTexShadow, vec3(baseUV.x+u2, baseUV.y+v2, baseUVW.z));
		
		total /= 144.0;
#endif
		
		return 1.0-(blend*(1.0-total));
	}
	
	return 1.0;
#else
	if (blend > 0.0)	// So then -1.0 will disable
	{
		return 1.0-(blend*(1.0-texture(inTexShadow, baseUVW)));
	}
	
	return 1.0;
#endif
}

float CALC_ShadowMask_K(){
	return CALC_ShadowMask(inShadowTrans[1].w, outPos_KL);
}

#else
float CALC_ShadowMask_K(){ return 1.0; }
#endif

#ifdef SOB_SHADOWS_DUAL
float CALC_ShadowMask_F(){
	return CALC_ShadowMask(inShadowTrans[3].w, outPos_FL);
}
#else
float CALC_ShadowMask_F(){ return 1.0; }
#endif

void main()
{
#ifdef SOB_USECLIP
	#ifdef PATCH_ALTHYPER
		if (outClipD <= 0.0)
		{
			discard;
		}
	#endif
#endif

#ifdef SOB_TEAMTEX
	vec3 texTeam = texture(inTexTeam, outUV0).xyz;
	
	#ifdef SOB_SCISSOR
		if (texTeam.r < 0.5)
		{
			discard;
		}
	#endif

#else
	vec3 texTeam = vec3(0.0);
#endif

#ifdef SOB_RESOURCE

	//abs(0.5-fract(inTime.x*0.125))*2.0;	// Auto-cycle fade for testing
	
	#ifdef SOB_SALVAGE
	float resFade = clamp(1.0-inLifeParams.y, 0.0, 1.0);
	resFade *= resFade;		// Curve the burn rate
	
		#ifdef SOB_DEBRIS
		resFade = 1.0-inFXInfo[0].a;
		#endif
	#else
	float resFade = inFadeInfo.x;
	#endif
	
	float resDelta = inFadeInfo.y;
	
	float fadeWindow = inFadeWindow.x;
	float fadeLo = inFadeWindow.y;
	float fadeHi = inFadeWindow.z;
	
	#ifdef SOB_SALVAGE
	float fadeRange = (fadeHi-fadeLo)+(fadeWindow*2.0);
	#else
	float fadeRange = (fadeHi-fadeLo)+fadeWindow;
	#endif

	float fadeProgRaw = texture(inTexProgress, outUV0).r;
	float fadeProg = max(fadeProgRaw, fadeLo);
	float fadeRes = fadeLo-fadeWindow+(resFade*fadeRange);
	float fadeResLim = min(fadeRes, fadeHi);
	
	float texProgress = (fadeProg-fadeResLim)/fadeWindow;
	
	float burnScale = clamp(texProgress*1000.0, 0.0, 1.0);
	float texBurn = clamp((1.0-texProgress)*burnScale, 0.0, 1.0);
	texBurn *= clamp(1.0-((fadeRes-fadeResLim)/fadeWindow), 0.0, 1.0);
	texBurn = pow(texBurn, 0.25);
	
	texProgress = clamp(texProgress, 0.0, 1.0);
	
	#ifdef SOB_SALVAGE
		float fadeScissor = fadeProg-max(fadeLo, fadeResLim);
		if (fadeScissor <= 0.0)
		{
			discard;
		}
	#endif
	
	texBurn *= texProgress*4.0;	// 0.5*0.5 = 0.25
	
	#ifdef SOB_DUALINPUT
		vec3 texNorm = mix(texture(inTexNorm, outUV_Norm1).rgb, texture(inTexNorm, outUV_Norm0).rgb, texProgress);
		vec4 texDiff = mix(texture(inTexDiff, outUV_Diff1)*inMulDiff1, texture(inTexDiff, outUV_Diff0)*inMulDiff0, texProgress);
		vec4 texGlowRGB = mix(texture(inTexGlow, outUV_Glow1)*inMulGlow1, texture(inTexGlow, outUV_Glow0)*inMulGlow0, texProgress);
		vec4 texGlow = mix(texture(inTexSpec, outUV_Spec1)*inMulSpec1, texture(inTexSpec, outUV_Spec0)*inMulSpec0, texProgress);
	#else
		vec3 texNorm = texture(inTexNorm, outUV0).rgb;
		vec4 texDiff = texture(inTexDiff, outUV0);
		vec4 texGlowRGB = texture(inTexGlow, outUV0);
		vec4 texGlow = texture(inTexSpec, outUV0);
	#endif
	
	texNorm = normalize(texNorm*2.0-1.0);
	
	float isPaint = texGlow.g;
	texGlow.g = 0.0;
	
	#ifdef SOB_SALVAGE
		float styleDelta = 0.0;		// Deltas make no sense for Salvage
	#else
		float styleDelta = inGlowStyle.x;
	#endif
	
	float styleBurn = inGlowStyle.y;
	
	float glowDeltScale = mix(1.0, clamp((resDelta-0.25)*1.35, 0.0, 1.0), styleDelta);
	float glowBurnScale = mix(1.0, texBurn, styleBurn);
	texGlowRGB *= glowDeltScale*glowBurnScale;
#else
	#ifdef SOB_THRUSTERS
		float thrust = inColEngine.x;

		vec4 texDiffOn = texture(inTexDiffOn, outUV0);
		vec4 texGlowOn = texture(inTexGlowOn, outUV0);
		vec4 texDiffOff = texture(inTexDiffOff, outUV0);
		vec4 texGlowOff = texture(inTexGlowOff, outUV0);
		
		vec4 texDiff = mix(texDiffOff, texDiffOn, thrust);
		vec4 texGlow = mix(texGlowOff, texGlowOn, thrust);
	#else
		vec4 texDiff = texture(inTexDiff, outUV0);
		vec4 texGlow = texture(inTexGlow, outUV0);
		
		#ifdef SOB_GLOWRGB
			vec4 texGlowRGB = texGlow;
			texGlow = texture(inTexSpec, outUV0);
			texGlow.g = 1.0;
		#endif
	#endif
	
	vec3 texNorm = normalize(texture(inTexNorm, outUV0).rgb*2.0-1.0);
	
	#ifdef SOB_TEAM	
		float isPaint = texTeam.r*texTeam.g*(1.0-texTeam.b);
	#else
		float isPaint = 1.0-texTeam.b;
	#endif
#endif

	// Normal and Eye to Pos in World Space
#ifdef NO_NORMAL_MAP
	vec3 worldNorm = normalize(mat3(inMatM)*vec3(outNorm));
#else
	vec3 tempTW = mat3(outTan, outBiNorm, outNorm)*texNorm;
	vec3 worldNorm = normalize(mat3(inMatM)*tempTW);
#endif

	float shadowMask_K = CALC_ShadowMask_K();
	float shadowMask_F = CALC_ShadowMask_F();

#ifdef SOB_BADGE
	vec4 texBadge = texture(inTexBadge, outUV1);
	texGlow.b = mix(texGlow.b, 0.15, texBadge.a*0.35);
	texGlow.r = mix(texGlow.r, 0.1, texBadge.a*0.35);
	isPaint *= 1.0-texBadge.a;
#endif

	// Paint and Other map channels
	isPaint = 1.0-isPaint;
	float mapSpecSharp = texGlow.r;
	float mapGlowMask = texGlow.g;
	float mapSpecMask = max(0.0, texGlow.b-texGlow.g);

	vec3 worldEye = normalize(outEye_W);
	float worldDist = length(outEye_W);
	
#ifdef SOB_2SIDED
	if (false == gl_FrontFacing)
	{
		worldNorm = -worldNorm;
	}
#endif
	
	// Diffuse
	float extDiffFren = inSurfDiff.y;
	
	// Glow
	float extGlowPower = inSurfGlow.x;
	float extGlowFren = inSurfGlow.y;
	
	// Specular
	float extSpecPower = inSurfSpec.x;
	float extSpecFren = inSurfSpec.y;
	float extSpecCurve = inSurfSpec.z;
	
	// Paint Gloss
	float extPaintCurve = inSurfPaint.x;
	float extPaintScale = inSurfPaint.y;
	float extPaintBias = inSurfPaint.z;
	float extPaintDim = inSurfPaint.w;
	
	// Gloss
	float extGlossCurve = inSurfGloss.x+(extPaintCurve*isPaint);
	float extGlossScale = inSurfGloss.y+(extPaintScale*isPaint);
	float extGlossBias = inSurfGloss.z+(extPaintBias*isPaint);
	
	extSpecPower = mix(extSpecPower, extSpecPower*extPaintDim, isPaint);
	
	float specGloss = max(1.0, pow(mapSpecSharp, extGlossCurve)*extGlossScale)+extGlossBias;
	float pointGloss = max(1.0, specGloss*0.25);
	
	// Reflections
	float extReflPower = inSurfRefl.x;
	float extReflFren = inSurfRefl.y;
	float extReflAddMix = inSurfRefl.z;
	
	// Fresnel
	float extFrenPower = inSurfFren.x;
	float extFrenBias = inSurfFren.y;
	float extFrenCurve = inSurfFren.z;
	float frenDeg = clamp(pow(extFrenBias*(1.0-abs(dot(worldNorm, worldEye))), extFrenCurve)*extFrenPower, 0.0, 1.0);
	
	// Map Channel * Powers
	float peakStrength = 1.0+(mix(inSurfPeak.x, inSurfPeak.y, isPaint)*mix(1.0, inSurfPeak.z, frenDeg));
	float glowStrength = mapGlowMask*max(0.0, extGlowPower-(extGlowFren*frenDeg));
	float specRawStrength = mapSpecMask*extSpecPower;
	float specStrength = mix(specRawStrength, 1.0, frenDeg*mapSpecSharp*extSpecFren);
	float reflStrength = mix(mapSpecMask*extReflPower, 1.0, frenDeg*mapSpecSharp*extReflFren);
	
	// Time to get painted (paint + diffuse curves logic)
	float paintCurve = inPaintStyle.x;
	float paintDarkScale = inPaintStyle.y;
	float paintDarkOfs = inPaintStyle.z;
	vec4 paintBase = mix(vec4(0.5, 0.5, 0.5, 1.0), texDiff, paintCurve);
	
#ifdef SOB_TEAM
	// Base paint calc - paint, stripe, team, etc...
	vec4 paint = mix(inColTeam, paintBase, texTeam.r);
	paint = mix(inColStripe, paint, texTeam.g);
	
#ifdef SOB_BADGE
	vec4 lumMap = vec4(0.299, 0.587, 0.114, 0.0);
	vec4 diffLum = vec4(texDiff.r, texDiff.g, texDiff.b, dot(texDiff, lumMap));
	vec4 d_hi = clamp(((diffLum*2.0)-1.0), 0.0, 1.0);
	vec4 d_lo = clamp(((diffLum*paintDarkScale)-paintDarkOfs), 0.0, 1.0);	// Slight overdark for badge contouring
	paint = mix(d_lo*paint, vec4(1.0), d_hi);
	diffLum.rgb = d_lo.w*texBadge.rgb;
	d_lo = mix(diffLum, vec4(1.0), d_hi.w);
	paint = mix(paint, d_lo, texBadge.a);
#else
	vec4 d_hi = clamp(((texDiff*2.0)-1.0), 0.0, 1.0);
	vec4 d_lo = clamp(((texDiff*paintDarkScale)-paintDarkOfs), 0.0, 1.0);
	paint = mix(d_lo*paint, vec4(1.0), d_hi);
#endif

#else
	vec4 d_hi = clamp(((texDiff*2.0)-1.0), 0.0, 1.0);
	vec4 d_lo = clamp(((texDiff*paintDarkScale)-paintDarkOfs), 0.0, 1.0);
	vec4 paint = mix(d_lo*paintBase, vec4(1.0), d_hi);
#endif

	float diffStrength = max(0.0, 1.0-specRawStrength);
	diffStrength = pow(diffStrength, 1.0-(frenDeg*extDiffFren));
	
#ifdef SOB_GLOWRGB
	vec3 diffRGB = paint.rgb;
	vec3 glowRGB = texGlowRGB.rgb*0.8;
#else
	vec3 diffRGB = paint.rgb*((1.0-mapGlowMask)*diffStrength);
	vec3 glowRGB = paint.rgb*mapGlowMask;
#endif

	glowRGB *= glowStrength;
	
	// Seed lighting with Ambient+Black
	vec3 diffAll = inLightCore[0].rgb;
	vec3 specAll = vec3(0,0,0);
		
	// Key Light
	vec3 litNorm = normalize(inLightCore[1].rgb);
	vec3 holdLit_K = litNorm;
	
#ifndef SOB_BAYLIGHT
	float litDif = clamp(dot(litNorm, worldNorm), 0.0, 1.0);
	vec3 litRefl = reflect(-litNorm, worldNorm);
	float litSpec = clamp(dot(-worldEye, litRefl), 0.0, 1.0)*peakStrength;
	litSpec = pow(litSpec, specGloss)*min(litDif*1000, 1.0);
	diffAll += shadowMask_K*inLightCore[2].rgb*litDif;
	specAll += shadowMask_K*inLightCore[3].rgb*litSpec;
	
	// Fill Light
	litNorm = normalize(inLightCore[4].rgb);
	vec3 holdLit_F = litNorm;
	litDif = clamp(dot(litNorm, worldNorm), 0.0, 1.0);
	litRefl = reflect(-litNorm, worldNorm);
	litSpec = clamp(dot(-worldEye, litRefl), 0.0, 1.0)*peakStrength;
	litSpec = pow(litSpec, specGloss)*min(litDif*1000, 1.0);
	diffAll += shadowMask_F*inLightCore[5].rgb*litDif;
	specAll += shadowMask_F*inLightCore[6].rgb*litSpec;
	
	// Point lights...
	int inP = inLightCounts.x;	// Points?
	int inL = 0;
	for (; inL<inP; inL++)
	{
		int inS = inL*3;
		vec3 litVec = inLightShip[inS].rgb-outPos_W;
		vec3 atenVec = vec3(inLightShip[inS].w, inLightShip[inS+1].w, inLightShip[inS+2].w);
		float litLen = length(litVec);
		litVec = normalize(litVec);
		litDif = clamp(dot(litVec, worldNorm), 0.0, 1.0);
		float atenVal = 1.0/(atenVec.x+(atenVec.y*litLen)+(atenVec.z*litLen*litLen));
		diffAll.rgb += inLightShip[inS+1].rgb*litDif*atenVal*2.0;

		float subSpec = clamp(dot(-worldEye, reflect(-litVec, worldNorm)), 0.0, 1.0)*peakStrength;
		subSpec = pow(subSpec, pointGloss)*min(litDif*1000, 1.0);
		specAll.rgb += inLightShip[inS+2].rgb*subSpec*atenVal*2.0;
	}
#else
	diffAll = vec3(1.0, 1.0, 1.0);
#endif
	
#ifdef SOB_LIGHT_HQ
	vec3 beamDif = vec3(0.0f);
	vec3 beamSpec = vec3(0.0f);
	
	float beamGloss = max(1.0, specGloss*0.75);
	
	int inB = inLightCounts.x+inLightCounts.y;	// Beams?
	for (; inL<inB; inL++)
	{
		int inS = inL*3;
		
		vec3 beamHead = inLightShip[inS].xyz;
		float beamLen = inLightShip[inS].w;
		vec3 beamAxis = inLightShip[inS+1].xyz;
		float beamOORad = inLightShip[inS+1].w;
		vec3 beamRGB = inLightShip[inS+2].rgb;
		float beamCurve = inLightShip[inS+2].w;
		
		// Determine the closest on-beam point
		vec3 sepOfs = outPos_W-beamHead;
		float sepA = clamp(dot(sepOfs, beamAxis), 0.0, beamLen);
		vec3 litPos = beamHead+(beamAxis*sepA);
		
		// Gather angle/distance
		vec3 litVec = litPos-outPos_W;
		float litLen = length(litVec);
		litVec = normalize(litVec);
		
		// Attenuate for distance
		float atenVal = pow(1.0-min(litLen*beamOORad, 1.0), beamCurve)*2.0;	// *2 to adjust for HW old headroom
		
		// Bias diffuse angle due to co-incidence with beam 
		float litBias = abs(dot(worldNorm, beamAxis));
		litDif = clamp(dot(worldNorm, litVec), 0.0, 1.0);
		litDif = mix(litDif, 1.0, litBias);
		
		vec3 subRefl = reflect(-litVec, worldNorm);
		float subSpec = max(dot(-worldEye, subRefl), 0.0);
		float subBoost = abs(dot(inLightShip[inS+1].rgb, subRefl));	// Reflection along beam axis?
		subSpec = min(subSpec*(1.0+(subBoost*0.25)), 1.0)*peakStrength;
		subSpec = pow(subSpec, beamGloss)*min(litDif*1000, 1.0);
		
		beamDif += beamRGB*litDif*atenVal;
		beamSpec += inLightShip[inS+2].rgb*subSpec*atenVal;
	}
	
	diffAll += beamDif;
	specAll += beamSpec;
	
	//diffAll = beamDif;
	//specAll = beamSpec;
#endif
	 
	// Apply final lighting 
	paint.rgb = (diffRGB*diffAll)+glowRGB+(specAll*specStrength);

#ifndef SOB_BAYLIGHT
	// Add reflections
	vec3 envNorm = reflect(worldEye, worldNorm);
	vec4 texE0 = texture(inTexEnv0, envNorm);
	vec4 texE1 = texture(inTexEnv1, envNorm);
	vec4 reflTex = mix(texE0, texE1, mapSpecSharp);
	
	
#ifdef SOB_SHADOWS_ON
	float envMask = 1.0-(max((dot(envNorm,holdLit_K)*5.0)-4.0, 0.0)*(1.0-shadowMask_K));
	
	#ifdef SOB_SHADOWS_DUAL
		envMask *= 1.0-(max((dot(envNorm,holdLit_F)*5.0)-4.0, 0.0)*(1.0-shadowMask_F));
	#endif
#else
	float envMask = 1.0;
#endif

	float reflDeg = reflStrength*reflTex.a*inBGEnvParams.r*envMask;
	float reflAdd = extReflAddMix;
	float reflAlpha = 1.0-reflAdd;
	
	reflTex.rgb += inBGAddLight.rgb;
	
	paint.rgb += reflTex.rgb*reflDeg*reflAdd;
	paint.rgb = mix(paint.rgb, reflTex.rgb, reflDeg*reflAlpha);
#endif

	paint.a = inSOBParams.x;
	
#ifdef SOB_TEAM
	if (inSOBParams.y > 0.0)
	{
		float frenCloak = pow((1.0-abs(dot(worldNorm, worldEye)))*1.06, 2.0)*2.0-1.0;
		
		if (frenCloak > 0.0)
		{
			vec3 noisePos = outPos_W.xyz*0.05;
			vec3 timePos = holdLit_K*(inTime.z*2.0);
			float cloakNoise = HELP_Noise3(noisePos+timePos)*0.5+1.5;
			frenCloak = clamp(frenCloak*cloakNoise*0.5, 0.0, 1.0);
		}
		
		float cloakPaint = 1.0-(0.5*inSOBParams.y);
		paint.rgb = (paint.rgb*cloakPaint)+vec3(max(frenCloak, 0.0)*inSOBParams.y*1.5);
	}
#endif
	
#ifndef SOB_DEBRIS
	// UI Effect (glow, etc)
	paint.rgb += vec3(inColEffect)*inColEffect.a;
#endif
	
	paint.rgb = pow(paint.rgb, vec3(inGammaScale))*inGammaScale.a;
	
#ifdef SOB_USECLIP
	vec3 hyperSpace = vec3(inGammaScale.a);
	
	if (false == gl_FrontFacing)
	{
		paint.rgb = hyperSpace;
	}
	else
	{
#ifdef PATCH_ALTHYPER
		float hyperEdge = outClipD*0.02;
#else
		float hyperEdge = gl_ClipDistance[0]*0.02;
#endif
		if (hyperEdge < 1.0)
		{
			vec3 planeScales = vec3(1.5)+(abs(inClipPlane.xyz)*20.0);
			vec3 noisePos = outPos_W.xyz/planeScales;
			vec3 timePos = inClipPlane.xyz*(inTime.z*2.0);
			
			float hyperNoise = HELP_Noise3(noisePos+timePos)*0.5+1.5;
			hyperEdge = 1.0-clamp(hyperEdge*hyperNoise, 0.0, 1.0);
			hyperEdge = min(pow(hyperEdge*1.1, 5.0)/1.2, 1.0);
			
			paint.rgb = mix(paint.rgb, hyperSpace, hyperEdge*inSOBParams.z);
		}
	}
#endif
	
	float maxFog = inFogColor.a*inFogColor.w;
	if (maxFog > 0.0)
	{
		float useFog = clamp((worldDist-inFogWindow.x)/(inFogWindow.z-inFogWindow.x), inFogWindow.y, inFogWindow.w);
		paint.rgb = mix(paint.rgb, inFogColor.rgb, useFog*inFogColor.a);
	}
	
	paint *= getShipExp();
	
#ifdef SOB_BAYLIGHT
	paint *= getBayExp();
#endif

	// Enable to show 'bad UV' patches (as magenta)
	//vec2 delUV = vec2(dFdx(outUV0.x), dFdy(outUV0.y));
	//float delD = 1.0-min(1.0, length(delUV)*1000000.0);
	//paint.rgb = mix(paint.rgb, vec3(delD, 0.0, delD), delD);
	
#ifdef SOB_ALPHA
	paint.a *= texTeam.r;
#endif
	
	finalCol0 = paint;
}
