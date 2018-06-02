smooth in vec2 outUV0;
smooth in vec3 outNorm;
smooth in vec3 outTan;
smooth in vec3 outBiNorm;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

#ifdef GLOW_ANIM
smooth in vec3 outPos;
#endif

#ifdef USE_MELT
smooth in vec3 outPos;
uniform sampler2D inTexScorched;
uniform sampler2D inTexBurn;
uniform vec4 inTrigger;
uniform float inTimeScale;
#endif

#ifdef USE_MELTED
uniform sampler2D inTexScorched;
uniform sampler2D inTexBurn;
#endif

#ifdef ADD_MOOD
uniform vec4 inMoodLight;
uniform vec3 inMoodDir;
#endif

uniform mat4 inMatMV;

uniform sampler2D inTexTerrain;
uniform sampler2D inTexNight;
uniform sampler2D inTexEnviro;
uniform sampler2D inTexNormal;
uniform samplerCube inTexEnv0;
uniform samplerCube inTexEnv1;

uniform vec4 inFade;
uniform vec4 inAddLight;

uniform vec4 inTime;

uniform vec4 inAtmoInfo;
uniform vec2 inAtmoFade;
uniform vec2 inScatterInfo;
uniform vec4 inLightScales;
uniform vec3 inHaloKeySurf;
uniform vec3 inHaloFillSurf;

#ifdef USE_CLOUDS
uniform sampler2D inTexClouds;
uniform sampler2D inTexWarp;
uniform vec3 inHaloKeyCloud;
uniform vec3 inHaloFillCloud;
uniform vec4 inMoveCloud1;
uniform vec4 inMoveCloud2;
uniform vec4 inMoveCloud3;
uniform vec3 inTintCloud1;
uniform vec3 inTintCloud2;
uniform vec3 inTintCloud3;
uniform vec2 inMoveWarp;
#endif

uniform vec4 inSurfDiff;
uniform vec4 inSurfGlow;
uniform vec4 inSurfSpec;
uniform	vec4 inSurfGloss;
uniform vec4 inSurfRefl;
uniform vec4 inSurfFren;

uniform vec4 inFinalGama;
uniform vec3 inReliefScale;

uniform vec4 inLightCore[7];

#ifdef USE_MELT
float maxEvent = 0.0;
float maxEdge = 0.0;
float sumEdge = 0.0;
float maxEventC = 0.0;
float maxEdgeC = 0.0;
float addEvent = 0.0;

const vec4 eventPos[5] = vec4[5](		// XYZ, Range
	vec4(10,20,30,4.0),
	vec4(15,-20,30,3.7),
	vec4(-45,-20,25,3.0),
	vec4(-40,30,20,2.9),
	vec4(25,0,12,2.4)
);

const vec4 eventTimes[5] = vec4[5](		// Delay, Limit, Distort, Fold
	vec4(0.1,5,0.01,3.413),
	vec4(3.25,5.5,0.007,-3.1),
	vec4(5.25,3.5,0.012,2.97),
	vec4(5.75,4,0.011,-4.01),
	vec4(6.0,2.5,0.0091,5.8)
);

void CALC_event(int index, float simTime, vec3 surfPos)
{
	//simTime = 10.0;
	vec3 origin = normalize(eventPos[index].xyz);
	float distRaw = acos(dot(origin, surfPos))*3.0;
	
	if (distRaw <= eventPos[index].w)
	{
		vec3 axisy = cross(vec3(0.0, 0.0, 1.0), origin);
		vec3 planed = surfPos*mat3(cross(axisy, origin), axisy, origin);
		float dirang = atan(planed.y, planed.x);
		float sharpSin = sin((distRaw*3.0*eventTimes[index].w*0.1)+(dirang*(27-(index*3))));
		sharpSin *= sharpSin*sharpSin;	// Still negative...
		//sharpSin *= sharpSin*sharpSin*0.5;
		float bend = (sin((distRaw*eventTimes[index].w*-0.25)+(dirang*5))+cos(dirang*(9-index))+sharpSin)+2.5;
		float distTo = distRaw*(1.0+(bend*eventTimes[index].z));
		float distBk1 = distRaw*(1.0+(bend*eventTimes[index].z*4.0));
		float distBk2 = distRaw*(1.0+(bend*eventTimes[index].z*(8.0-(index*0.43))));
		
		float fade = clamp((eventPos[index].w-distTo)*1.5, 0.0, 1.0);
		float fadeEv = clamp((eventPos[index].w-distTo)*2.25, 0.0, 1.0);
		
		float timing = clamp((simTime-eventTimes[index].x)/10.0, 0.0, 1.0);
		float curved = pow(timing, 0.92)*eventTimes[index].y;
		
		float localTime = max(0.0, curved-distTo);
		float localFade = min(1.0, localTime*1000.0)/((localTime+0.001)*4.0);
		float localScale = 3.0+clamp((1.0-(localFade*0.25))*3.0, 0.0, 4.0);
		float localEvent = max(0.0, 1.0-(((distBk1*0.5)+(distTo*0.5))*localScale))*12.0;
		addEvent += localEvent*localFade;
		
		float useBlend = min(1.0, distRaw/eventPos[index].w);
		float useDist = ((1.0-useBlend)*distBk2)+(useBlend*distTo);
		float event = max(0.0, curved-useDist);
		float edge = min(3.0-(useBlend*1.75)-(bend*0.62*useBlend), event*100.0)/((pow(event*2.5, 1.4)+0.001)*(20.0+(useBlend*40.0)));
		edge = clamp(edge, 0.0, 1.0);
		edge = pow(edge*fade, 0.25+(useBlend*useBlend*2.0));		
		sumEdge += edge;
		maxEvent = max(maxEvent, min(1.0, event*(1.0+(useBlend*3.5)))*fadeEv);
		maxEdge = max(maxEdge, edge);
		
		float fadeC = clamp((eventPos[index].w-distTo)*0.25, 0.0, 1.0);
		fadeC *= fadeC;
		event = max(0.0, curved-(distTo*0.65));
		edge = min(1.0, event*1000.0)/((pow(event*3.0, 1.4)+0.001)*30.0);
		maxEventC = max(maxEventC, min(event*11.0, 1.0)*fade);
		
		float edgeAng1 = dirang+(simTime*513.0);
		float edgeAng2 = dirang+(simTime*394.0);
		float edgeNoise = (sin(edgeAng1*19)*0.4)+(sin(0.61+(edgeAng2*14))*0.35)+(sin(0.379+(edgeAng2*-7))*0.25);
		float edgeFade = (1.0-fadeC)*(edgeNoise+1.0)*0.025;
		maxEdgeC += edge*max(0.0, fadeC-edgeFade);
	}
}
#endif

layout (location = 0) out vec4 finalCol0;

void main()
{
	// Glow
	float extGlowPower = inSurfGlow.x;
	float extGlowFren = inSurfGlow.y;
	float extGlowKeyOfs = inSurfGlow.z;
	float extGlowKeyScale = inSurfGlow.w;
	
	// Terrain - Surface masks
#ifdef USE_MELTED
	vec4 texDiff = texture(inTexScorched, outUV0);
	vec4 texNight = texture(inTexBurn, outUV0);
	vec4 texEnv = texture(inTexEnviro, outUV0);
	
	float mapSpecSharp = texEnv.r*0.25;
	float mapSpecMask = texEnv.b*0.25;
#else
	vec4 texDiff = texture(inTexTerrain, outUV0);
	vec4 texNight = texture(inTexNight, outUV0);
	vec4 texEnv = texture(inTexEnviro, outUV0);
	
	float mapSpecSharp = texEnv.r;
	float mapSpecMask = texEnv.b;
#endif
	
#ifdef USE_MELT
	// Destruction...
	float simTime = inTimeScale*(inTime.z-inTrigger.z);
	//float simTime = fract(inTime.z*0.05)*20.0;
	vec3 surfPos = normalize(outPos);
	
	CALC_event(0, simTime, surfPos);
	CALC_event(1, simTime, surfPos);
	CALC_event(2, simTime, surfPos);
	CALC_event(3, simTime, surfPos);
	CALC_event(4, simTime, surfPos);
	
	maxEdge *= clamp(1.0-maxEvent, 0.0, 1.0);	// No leading edge behind...
	maxEdgeC = mix(maxEdgeC*0.25, maxEdgeC*0.1, clamp(maxEvent, 0.0, 1.0));
	
	sumEdge = clamp(sumEdge-maxEdge, 0.0, 1.0);
	
	float blendTer = clamp(maxEvent, 0.0, 1.0);
	float blendGlo = clamp(maxEvent+(maxEdge*0.25), 0.0, 1.0);
	float scaleC1 = clamp(1.0-((maxEventC*1.45)-0.2), 0.0, 1.0);
	float scaleC2 = clamp(1.0-((maxEventC*1.53)-0.31), 0.0, 1.0);
	float scaleC3 = clamp(1.0-((maxEventC*1.61)-0.37), 0.0, 1.0);
	float addC1 = clamp(maxEdgeC, 0.0, 1.0);
	float addC2 = clamp(maxEdgeC*1.5, 0.0, 1.0);
	float addC3 = clamp(maxEdgeC*2.0, 0.0, 1.0);
	
	vec4 texScorch = texture(inTexScorched, outUV0);
	vec4 texBurn = texture(inTexBurn, outUV0);
	
	texNight.rgb *= clamp(1.0-(maxEventC*5.0), 0.0, 1.0);
	texBurn.rgb *= 1.0+(maxEdge*5.0);
	texBurn.rgb += vec3(1.0, 0.5, 0.2)*clamp((pow(maxEdge*1.05,3.0)*5.0)+(sumEdge*0.75), 0.0, 1.0);
	texBurn.rgb += vec3(1.0, 0.75, 0.4)*addEvent;
	
	texDiff.rgb = mix(texDiff.rgb, texScorch.rgb, blendTer);
	texNight.rgb = mix(texNight.rgb, texBurn.rgb, blendGlo);
	extGlowKeyOfs = mix(extGlowKeyOfs, 2.0, blendGlo);
	extGlowKeyScale = mix(extGlowKeyScale, 1.0, blendGlo);
	
	mapSpecSharp = mix(mapSpecSharp, mapSpecSharp*0.25, blendTer);
	mapSpecMask = mix(mapSpecMask, mapSpecMask*0.25, blendTer);
	
	float hazeScale = 1.0-(clamp(blendTer+blendGlo, 0.0, 1.0)*0.6);
	float hazeAdd = clamp(addEvent+(maxEdge), 0.0, 1.0);
	float hazeScaleC = 1.0-(clamp(maxEventC+(maxEdgeC*0.25), 0.0, 1.0)*0.6);
#else
	#ifdef USE_MELTED
		extGlowKeyOfs = 2.0;
		extGlowKeyScale = 1.0;
		const float scaleC1 = 0.0;
		const float scaleC2 = 0.0;
		const float scaleC3 = 0.0;
		const float hazeScale = 0.4;
		const float hazeAdd = 0.0;
		const float hazeScaleC = 0.4;
	#else
		const float scaleC1 = 1.0;
		const float scaleC2 = 1.0;
		const float scaleC3 = 1.0;
		const float hazeScale = 1.0;
		const float hazeAdd = 0.0;
		const float hazeScaleC = 1.0;
	#endif
	
	const float addC1 = 0.0;
	const float addC2 = 0.0;
	const float addC3 = 0.0;
#endif
	
#ifdef USE_CLOUDS
	// Clouds - Warping layer
	vec2 ofsCW = vec2(fract(inTime.z*inMoveWarp.x), fract(inTime.z*inMoveWarp.y));
	vec4 texCW = texture(inTexWarp, outUV0+ofsCW);
	
	// Clouds - Lower layer
	vec2 ofsC1 = vec2(fract(inTime.z*inMoveCloud1.x), fract(inTime.z*inMoveCloud1.y));
	ofsC1 += (texCW.xy-0.5)*inMoveCloud1.zw;
	float texC1 = (texture(inTexClouds, outUV0+ofsC1).r*scaleC1)+addC1;
	
	// Clouds - Mid layer
	vec2 ofsC2 = vec2(fract(inTime.z*inMoveCloud2.x), fract(inTime.z*inMoveCloud2.y));
	ofsC2 += (texCW.xy-0.5)*inMoveCloud2.zw;
	float texC2 = (texture(inTexClouds, outUV0+ofsC2).g*scaleC2)+addC2;
	
	// Clouds - Upper Layer
	vec2 ofsC3 = vec2(fract(inTime.z*inMoveCloud3.x), fract(inTime.z*inMoveCloud3.y));
	ofsC3 += (texCW.xy-0.5)*inMoveCloud3.zw;
	float texC3 = (texture(inTexClouds, outUV0+ofsC3).b*scaleC3)+addC3;
#endif
	
	// Normal and Eye to Pos in World Space
	vec3 normBoosted = texture(inTexNormal, outUV0).rgb*2.0-1.0;
	vec3 mapNorm = normalize(normBoosted*inReliefScale);
	
	vec3 tempTW = mat3(outTan, outBiNorm, outNorm)*mapNorm;
	vec3 worldNorm = normalize(mat3(inMatMV)*tempTW);
	
//	mat3 toWorld = mat3(inMatMV)*mat3(outTan, outBiNorm, outNorm);
//	vec3 worldNorm = normalize(toWorld*mapNorm);
	
	vec3 skyNorm = normalize(mat3(inMatMV)*outNorm);
	vec3 worldEye = normalize(outEye_W);
	float worldDist = length(outEye_W);
	
	// Diffuse
	float extDiffFren = inSurfDiff.y;
	
	// Specular
	float extSpecPower = inSurfSpec.x;
	float extSpecFren = inSurfSpec.y;
	float extSpecCurve = inSurfSpec.z;
	
	// Gloss
	float extGlossCurve = inSurfGloss.x;
	float extGlossScale = inSurfGloss.y;
	float extGlossBias = inSurfGloss.z;
	
	float specGloss = max(1.0, pow(mapSpecSharp, extGlossCurve)*extGlossScale)+extGlossBias;
	float specGlossC = 16.0;
	
	// Reflections
	float extReflPower = inSurfRefl.x*max(dot(worldNorm, -worldEye), 0.0);
	float extReflFren = inSurfRefl.y;
	float extReflAddMix = inSurfRefl.z;
	
	// Fresnel
	float extFrenPower = inSurfFren.x;
	float extFrenBias = inSurfFren.y;
	float extFrenCurve = inSurfFren.z;
	float frenDeg = clamp(pow(extFrenBias*(1.0-abs(dot(worldNorm, worldEye))), extFrenCurve)*extFrenPower, 0.0, 1.0);
	
	// Map Channel * Powers
	texNight *= max(0.0, extGlowPower-(extGlowFren*frenDeg));
	float specStrength = mix(mapSpecMask*extSpecPower, 1.0, frenDeg*mapSpecSharp*extSpecFren);
	float reflStrength = mix(mapSpecMask*extReflPower, 1.0, frenDeg*mapSpecSharp*extReflFren);
	float diffStrength = max(0.0, 1.0-specStrength);
	diffStrength = pow(diffStrength, 1.0-(frenDeg*extDiffFren));
	
	float shadowMask = 1.0;
	
	// Seed lighting with Ambient+Black
	vec3 diffAll = inLightCore[0].rgb*inLightScales.x;
	vec3 specAll = vec3(0,0,0);
	
	vec3 diffCl = inLightCore[0].rgb*inLightScales.y;
	vec3 specCl = vec3(0,0,0);
	
	float spin = fract(inTime.x*0.1)*6.28318530718;
	vec3 keySpun = 
		inLightCore[1].rgb;
	/*	vec3(
			(inLightCore[1].r*cos(spin))-(inLightCore[1].b*sin(spin)),
			inLightCore[1].g,
			(inLightCore[1].b*cos(spin))+(inLightCore[1].r*sin(spin))
		);*/
	
	vec3 fillSpun = 
		inLightCore[4].rgb;
	/*	vec3(
			(inLightCore[4].r*cos(spin))-(inLightCore[4].b*sin(spin)),
			inLightCore[4].g,
			(inLightCore[4].b*cos(spin))+(inLightCore[4].r*sin(spin))
		);*/
	
	// Light 100% away from camera (force halo mode)
	//keySpun = worldEye;
	
	float atmoFren = clamp(pow((extFrenBias+0.01)*(1.0-abs(dot(skyNorm, worldEye))), extFrenCurve*0.75)*extFrenPower, 0.0, 1.0);
	
	// Key Light
	float keyScale = inLightScales.z;
	vec3 keyNorm = normalize(keySpun);
	float keyEye = dot(keyNorm, worldEye);
	float keyDot = dot(keyNorm, worldNorm);
	float keyDotC = dot(keyNorm, skyNorm);
	float keyRef = dot(-worldEye, reflect(-keyNorm, worldNorm));
	float keyRefC = dot(-worldEye, reflect(-keyNorm, skyNorm));
	float keySpec = pow(clamp(keyRef, 0.0, 1.0), specGloss);
	float keySpecC = pow(clamp(keyRefC, 0.0, 1.0), specGlossC);
	
	float atmoKeyHalo = pow((keyEye*0.5)+0.5, inAtmoInfo.z);
	float atmoKeyDeg = pow(max(0.0, (keyDotC+0.4)/1.4), 1.25)*(0.25+(atmoKeyHalo*4.75))*hazeScale;
	vec3 atmoKeyColor = inHaloKeySurf*((atmoKeyDeg*atmoFren)+hazeAdd);
	
	// Fill Light
	float fillScale = inLightScales.w;
	vec3 fillNorm = normalize(fillSpun);
	float fillEye = dot(fillNorm, worldEye);
	float fillDot = dot(fillNorm, worldNorm);
	float fillDotC = dot(fillNorm, skyNorm);
	float fillRef = dot(-worldEye, reflect(-fillNorm, worldNorm));
	float fillRefC = dot(-worldEye, reflect(-fillNorm, skyNorm));
	float fillSpec = pow(clamp(fillRef, 0.0, 1.0), specGloss*0.5);
	float fillSpecC = pow(clamp(fillRefC, 0.0, 1.0), specGlossC*0.5);
	
	float atmoFillHalo = pow((fillEye*0.5)+0.5, inAtmoInfo.w);
	float atmoFillDeg = pow(max(0.0, (fillDotC+0.4)/1.4), 1.25)*(0.25+(atmoFillHalo*2.75))*hazeScale;
	vec3 atmoFillColor = inHaloFillSurf*((atmoFillDeg*atmoFren)+hazeAdd);
	
#ifdef USE_CLOUDS
	float atmoKeyDegC = pow(max(0.0, (keyDotC+0.5)/1.5), 1.20)*(0.25+(atmoKeyHalo*4.75));
	vec3 atmoKeyColorC = inHaloKeyCloud*((atmoKeyDegC*atmoFren*hazeScaleC)+hazeAdd);
	vec3 atmoFillColorC = inHaloFillCloud*((atmoFillDeg*atmoFren*hazeScaleC)+hazeAdd);
	
	diffCl += keyScale*((inLightCore[2].rgb*pow(max(0.0, (keyDotC+0.1)/1.1), 1.25))+atmoKeyColorC);
	specCl += keyScale*inLightCore[3].rgb*keySpecC;
	diffCl += fillScale*((inLightCore[5].rgb*max(0.0, fillDotC))+atmoFillColorC);
	specCl += fillScale*inLightCore[6].rgb*fillSpecC;
	
	// All clouds, all the time...
	//diffCl = vec3(1.0);
	//specCl = vec3(1.0);
	
	// vec3s cause layers to be colored...
	vec3 cloudL1 = ((diffCl*1.0)+(specCl*0.35))*inTintCloud1;
	vec3 cloudL2 = ((diffCl*1.0)+(specCl*0.4))*inTintCloud2;
	vec3 cloudL3 = ((diffCl*1.0)+(specCl*0.5))*inTintCloud3;
	
	vec3 cloudT = mix(mix(cloudL1, cloudL2, texC2), cloudL3, texC3);
	float cloudA = mix(mix(texC1, 1.0, texC2), 1.0, texC3);
		
	float cloudCover = 1.0-clamp((pow(cloudA, 0.85)-0.2), 0.0, 1.0);
#endif
	
	diffAll += keyScale*((inLightCore[2].rgb*max(0.0, keyDot))+atmoKeyColor);
	specAll += keyScale*inLightCore[3].rgb*keySpec;
	diffAll += fillScale*((inLightCore[5].rgb*max(0.0, fillDot))+atmoFillColor);
	specAll += fillScale*inLightCore[6].rgb*fillSpec;
	
#ifdef ADD_MOOD
	vec3 atmoMoodColor = vec3(0.0);
	if (inMoodLight.w > 0.0)
	{
		vec3 moodNorm = normalize(inMoodDir.xyz);
		float moodEye = dot(moodNorm, worldEye);
		float moodDot = dot(moodNorm, worldNorm);
		float moodDotC = dot(moodNorm, skyNorm);
		float moodRef = dot(-worldEye, reflect(-moodNorm, worldNorm));
		float moodRefC = dot(-worldEye, reflect(-moodNorm, skyNorm));
		float moodSpec = pow(clamp(moodRef, 0.0, 1.0), specGloss*0.5);
		float moodSpecC = pow(clamp(moodRefC, 0.0, 1.0), specGlossC*0.5);
		
		float atmoMoodHalo = pow((moodEye*0.5)+0.5, inAtmoInfo.w);
		float atmoMoodDeg = pow(max(0.0, (moodDotC+0.4)/1.4), 1.25)*(0.25+(atmoMoodHalo*2.75))*hazeScale;
		atmoMoodColor = inHaloFillSurf*((atmoMoodDeg*atmoFren)+hazeAdd);
		
		diffAll += inMoodLight.w*((inMoodLight.rgb*max(0.0, moodDot))+atmoMoodColor);
		specAll += inMoodLight.w*inMoodLight.rgb*moodSpec;
	}
#endif
	
#ifdef GLOW_ANIM
	vec3 noiseSeed1 = outPos*0.15;
	float noise1 = (HELP_Noise3(noiseSeed1)*0.5)+0.5;
	vec3 noiseSeed2 = outPos*0.6437;
	float noise2 = (HELP_Noise3(noiseSeed2)*0.5)+0.5;
	float noiseMix = pow((noise1*0.7)+(noise2*0.3), 0.8);
	vec3 noiseSeed3 = outPos*0.7421;
	float noise3 = (HELP_Noise3(noiseSeed3)*0.5)+0.5;
	float noiseRate = (noiseMix*8)+2.0;
	noiseRate = floor(noiseRate)*0.75;
	float noiseOfs = noise3*16.0;
	noiseOfs = floor(noiseOfs)*0.25;
	float pixTime = ((inTime.x*1.2)+noiseOfs)/noiseRate;
	float noiseTime = abs(1.0-(fract(pixTime)*2.0));
	noiseTime = mix(1.0, noiseTime, pow(noise3, 0.1));
	texNight.rgb *= vec3(noiseTime);
#endif
	
	// Apply final lighting
	vec3 glowEffect = texNight.rgb*clamp((dot(-keyNorm, skyNorm)+extGlowKeyOfs)*extGlowKeyScale, 0.0, 1.0);
	diffAll = (diffAll*vec3(diffStrength))+glowEffect;
	
	vec3 surfOut = (texDiff.rgb*diffAll)+(specAll*specStrength);
	
	// Add reflections
	vec3 envNorm = reflect(worldEye, worldNorm);
	vec4 texE0 = texture(inTexEnv0, envNorm);
	vec4 texE1 = texture(inTexEnv1, envNorm);
	vec4 reflTex = mix(texE0, texE1, mapSpecSharp);

	float reflDeg = reflStrength*reflTex.a;
	float reflAdd = extReflAddMix;
	float reflAlpha = 1.0-reflAdd;
	
	//surfOut = vec3(0.0);
	surfOut += reflTex.rgb*reflDeg*reflAdd;
	surfOut = mix(surfOut, reflTex.rgb, reflDeg*reflAlpha);
	
#ifdef USE_CLOUDS
	surfOut = mix(surfOut*cloudCover, cloudT, cloudA);
#endif

#ifdef USE_MELT
	float addAll = addC1+addC2+addC3;
	surfOut += vec3(0.2, 0.3, 0.5+(addAll*0.25))*addAll;
#endif

	float extScatterScale = inScatterInfo.x;
	float extScatterCurve = inScatterInfo.y;
		
	float scatterDeg = clamp((atmoKeyDeg+atmoFillDeg)*atmoFren*extScatterScale, 0.0, 1.0);
	vec3 scatterC = (keyScale*atmoKeyColor)+(fillScale*atmoFillColor);
	
#ifdef ADD_MOOD
	scatterC += inMoodLight.w*atmoMoodColor;
#endif
	
	vec3 scatterMix = scatterC*pow(scatterDeg, extScatterCurve);
	scatterMix = clamp(scatterMix, 0, 1);
	
	surfOut = clamp(surfOut, 0, 1);
	surfOut.r = 1.0-((1.0-scatterMix.r)*(1.0-surfOut.r));
	surfOut.g = 1.0-((1.0-scatterMix.g)*(1.0-surfOut.g));
	surfOut.b = 1.0-((1.0-scatterMix.b)*(1.0-surfOut.b));
	
	surfOut.rgb = pow(surfOut.rgb, vec3(inFinalGama))*inFinalGama.a;
	surfOut = (surfOut+inAddLight.rgb)*inFade.rgb*getBackExp().rgb;
	
	//surfOut = texNight.rgb;
	
	finalCol0 = vec4(surfOut, 1.0);
}
