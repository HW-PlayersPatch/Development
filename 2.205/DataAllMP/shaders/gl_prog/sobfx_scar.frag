smooth in vec2 outUV0;
smooth in vec2 outUV1;
smooth in vec3 outNorm;
smooth in vec3 outTan;
smooth in vec3 outBiNorm;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

#ifdef SOB_SHADOWS_ON
	uniform sampler2DShadow inTexShadow;

	uniform vec4 inShadowTrans[4];
	smooth in vec3 outPos_KL;

	#ifdef SOB_SHADOWS_DUAL
		smooth in vec3 outPos_FL;
	#endif
#endif

uniform vec4 inTime;

#ifdef PATCH_ALTHYPER
	smooth in float outClipD;
#endif

uniform sampler2D inTexDiff;
uniform sampler2D inTexGlow;
uniform sampler2D inTexSpec;
uniform sampler2D inTexNorm;
uniform sampler2D inTexMask;
uniform samplerCube inTexEnv0;
uniform samplerCube inTexEnv1;

uniform vec4 inClipPlane;
uniform vec4 inSOBParams;

uniform vec4 inFogColor;
uniform vec4 inFogWindow;

uniform mat4 inMatM;
uniform vec4 inColTeam;
uniform vec4 inColStripe;
uniform vec4 inColEffect;
uniform vec4 inColEngine;

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
#ifdef PATCH_ALTHYPER
	if (outClipD <= 0.0)
	{
		discard;
	}
#endif

	vec4 texDiff = texture(inTexDiff, outUV0);
	vec4 texSpec = texture(inTexSpec, outUV0);
	vec4 texMask = texture(inTexMask, outUV1);
	
	texDiff.a *= texMask.a;
	
	if (texDiff.a <= 0.0)
	{
		discard;
	}

	float shadowMask_K = CALC_ShadowMask_K();
	float shadowMask_F = CALC_ShadowMask_F();
	
	float isPaint = 1.0-texSpec.g;

	float mapSpecSharp = texSpec.g;
	float mapSpecMask = texSpec.r;

	// Normal and Eye to Pos in World Space
	vec3 mapNorm = normalize(texture(inTexNorm, outUV0).rgb*2.0-1.0);
	
	vec3 tempTW = mat3(outTan, outBiNorm, outNorm)*mapNorm;
	vec3 worldNorm = normalize(mat3(inMatM)*tempTW);
	
	//mat3 toWorld = mat3(inMatM)*mat3(outTan, outBiNorm, outNorm);
	//vec3 worldNorm = normalize(toWorld*mapNorm);

	vec3 worldEye = normalize(outEye_W);
	float worldDist = length(outEye_W);
		
	// Diffuse
	float extDiffFren = inSurfDiff.y;
		
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
	float peakStrength = 1.0+(mix(inSurfPeak.x, inSurfPeak.y, isPaint)*mix(1.0, inSurfPeak.z, frenDeg)*inSurfPeak.w);
	float specStrength = mix(mapSpecMask*extSpecPower, 1.0, frenDeg*mapSpecSharp*extSpecFren);
	float reflStrength = mix(mapSpecMask*extReflPower, 1.0, frenDeg*mapSpecSharp*extReflFren);
	float diffStrength = max(0.0, 1.0-specStrength);
	diffStrength = pow(diffStrength, 1.0-(frenDeg*extDiffFren));
	
	vec4 paint = texDiff;	// Might need to curve?
	
	// Seed lighting with Ambient+Black
	vec3 diffAll = inLightCore[0].rgb;
	vec3 specAll = vec3(0,0,0);
	
	// Key Light
	vec3 litNorm = normalize(inLightCore[1].rgb);
	vec3 holdLit_K = litNorm;
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
	diffAll = diffAll*vec3(diffStrength);
	paint.rgb = (paint.rgb*diffAll)+(specAll*specStrength);
	
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
	paint.a = texDiff.a*inSOBParams.x;
	
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
	
	// UI Effect (glow, etc)
	paint.rgb += vec3(inColEffect)*inColEffect.a;
	
	paint.rgb = pow(paint.rgb, vec3(inGammaScale))*inGammaScale.a;

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
	
	float maxFog = inFogColor.a*inFogColor.w;
	if (maxFog > 0.0)
	{
		float useFog = clamp((worldDist-inFogWindow.x)/(inFogWindow.z-inFogWindow.x), inFogWindow.y, inFogWindow.w);
		paint.rgb = mix(paint.rgb, inFogColor.rgb, useFog*inFogColor.a);
	}
	
	paint *= getShipExp();
	
	//paint.rgb = (worldNorm*0.5)+0.5;
	
	//paint.rgb = vec3(reflDeg);
	
	//paint.r = texSpec.r;
	//paint.g = texSpec.g;
	
	finalCol0 = paint;
}
