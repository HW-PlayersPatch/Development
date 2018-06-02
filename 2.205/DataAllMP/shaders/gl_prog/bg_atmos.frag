//smooth in vec4 outAtmo;
smooth in vec3 outNorm;
smooth in vec3 outNorm_W;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

#ifdef USE_MELT
smooth in vec3 outPos;
uniform vec4 inTrigger;
uniform float inTimeScale;
#endif

uniform vec4 inAtmoInfo;
uniform vec2 inAtmoFade;
uniform vec4 inLightScales;
uniform vec3 inHaloKeySurf;
uniform vec3 inHaloKeyCloud;
uniform vec3 inHaloFillSurf;
uniform vec3 inHaloFillCloud;

uniform vec4 inFinalGama;

uniform vec4 inDepth;
float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = (2.0*depth)-1.0;    
	float ret = (2.0*znear*zfar) / (zfar+znear-(z_n*(zfar-znear)));
	return ret;
}

uniform mat4 inMatMV;

uniform vec4 inFade;
uniform vec4 inAddLight;
uniform vec4 inTime;
uniform vec4 inLightCore[7];

#ifdef USE_MELT
float maxEvent = 0.0;
float maxEdge = 0.0;
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
		float sharpSin = sin((distRaw*3.0*eventTimes[index].w)+(dirang*27));
		sharpSin *= sharpSin*sharpSin;	// Still negative...
		sharpSin *= sharpSin*sharpSin*0.5;
		float bend = (sin((distRaw*eventTimes[index].w)+(dirang*5))+cos(dirang*9)+sharpSin)+2.5;
		float distTo = distRaw*(1.0+(bend*eventTimes[index].z));
		float distBk1 = distRaw*(1.0+(bend*eventTimes[index].z*4.0));
		float distBk2 = distRaw*(1.0+(bend*eventTimes[index].z*8.0));
		
		float fade = clamp((eventPos[index].w-distTo)*0.5, 0.0, 1.0);
		
		float noise = HELP_Noise3(vec3((surfPos.x+surfPos.z)*5.0, (surfPos.y-surfPos.z)*5.0, (distTo+(simTime*0.25))*2.0));
		
		float timing = clamp((simTime-eventTimes[index].x)/10.0, 0.0, 1.0);
		float curved = pow(timing, 0.92)*eventTimes[index].y;
		
		float localTime = max(0.0, curved-distTo);
		float localBreak = min(1.0, localTime*1000.0);
		float localFade = localBreak/((localTime+0.001)*4.0);
		float localScale = 3.0+clamp((1.0-(localFade*0.25))*3.0, 0.0, 4.0);
		float localEvent = max(0.0, 1.0-(((distBk1*0.5)+(distTo*0.5))*localScale))*12.0;
		addEvent += localEvent*localFade;
		
		float mulNoise = (noise*0.125)+1.0;
		float event = clamp((curved-distBk1)*4.0*mulNoise, 0.0, 3.0);
		float lead = clamp((curved-distBk2)*3.0*mulNoise, 0.0, 3.0);
		float edge = min(1.0, (event*15))-lead;
		edge = max(0.0, edge*(1.1-(bend*0.15)));
		maxEvent = max(maxEvent, event*fade);
		maxEdge = max(maxEdge, edge*fade);
		
		mulNoise = (noise*0.25)+1.0;
		float edgeMul = 0.5+(mulNoise*0.04);
		event = clamp((curved-(distTo*edgeMul))*11.0*mulNoise, 0.0, 3.0);
		lead = clamp((curved-(distTo*edgeMul))*10.0*mulNoise, 0.0, 1.0);
		edge = min(1.0, (event*5))-lead;
		maxEventC = max(maxEventC, event*fade);
		maxEdgeC += edge*fade;
	}
}
#endif

layout (location = 0) out vec4 finalCol0;

void main()
{
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
	
	float blendTer = clamp(maxEvent, 0.0, 1.0);
	float blendGlo = clamp(maxEvent+(maxEdge*0.25), 0.0, 1.0);
	float hazeScale = 1.0-(clamp(blendTer+blendGlo, 0.0, 1.0)*0.6);
	float hazeAdd = clamp(addEvent+(maxEdge), 0.0, 1.0);
	float hazeScaleC = 1.0-(clamp(maxEventC+(maxEdgeC*0.25), 0.0, 1.0)*0.6);
#else
	#ifdef USE_MELTED
		const float hazeScale = 0.4;
		const float hazeAdd = 0.0;
		const float hazeScaleC = 0.4;
	#else
		const float hazeScale = 1.0;
		const float hazeAdd = 0.0;
		const float hazeScaleC = 1.0;
	#endif
#endif

	vec3 skyNorm = normalize(mat3(inMatMV)*outNorm);
	vec3 worldEye = normalize(outEye_W);
	
	float frenThresh = inAtmoInfo.y;
	float frenR = 1.0-abs(dot(skyNorm, worldEye));
	float frenD = 1.0-min(1.0, max(0.0, frenR-frenThresh)/(1.0-frenThresh));
	vec3 frenC = vec3(1.0, 1.0, 1.0)*frenD;
	float atmoFren = frenD;
	
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
	
	float keyScale = inLightScales.z;
	vec3 keyNorm = normalize(keySpun);
	float keyEye = dot(keyNorm, worldEye);
	float keyDotC = dot(keyNorm, skyNorm);
	
	float atmoKeyHalo = pow((keyEye*0.5)+0.5, inAtmoInfo.z);
	float atmoKeyDeg = pow(max(0.0, (keyDotC+0.4)/1.4), 1.25)*(0.25+(atmoKeyHalo*4.75));
	vec3 atmoKeyColor = inHaloKeySurf*((atmoKeyDeg*atmoFren*hazeScale)+(hazeAdd*0.5));
	float atmoKeyDegC = pow(max(0.0, (keyDotC+0.5)/1.5), 1.20)*(0.25+(atmoKeyHalo*4.75));
	vec3 atmoKeyColorC = inHaloKeyCloud*((atmoKeyDegC*1.0*hazeScaleC)+hazeAdd);
	
	float fillScale = inLightScales.w;
	vec3 fillNorm = normalize(fillSpun);
	float fillEye = dot(fillNorm, worldEye);
	float fillDotC = dot(fillNorm, skyNorm);
	
	float atmoFillHalo = pow((fillEye*0.5)+0.5, inAtmoInfo.w);
	float atmoFillDeg = pow(max(0.0, (fillDotC+0.4)/1.4), 1.25)*(0.25+(atmoFillHalo*2.75));
	vec3 atmoFillColor = inHaloFillSurf*((atmoFillDeg*atmoFren*hazeScale)+(hazeAdd*0.5));
	vec3 atmoFillColorC = inHaloFillCloud*((atmoFillDeg*1.0*hazeScaleC)+hazeAdd);
	
	vec3 diffCl = (keyScale*atmoKeyColorC)+(fillScale*atmoFillColorC);
	float diffCl_F = (keyScale*atmoKeyDegC*atmoFren)+(fillScale*atmoFillDeg*atmoFren);
	vec3 diffTr = (keyScale*atmoKeyColor)+(fillScale*atmoFillColor);
	float diffTr_F = (keyScale*atmoKeyDeg*atmoFren)+(fillScale*atmoFillDeg*atmoFren);
	
	vec3 ringCl = mix(diffCl, diffTr, frenD);
	float ringCl_F = min(1.0, mix(diffCl_F, diffTr_F, frenD*hazeScale));//*frenD;
	
#ifdef USE_MELT
	float addC1 = clamp(maxEdgeC, 0.0, 1.0);
	float addC2 = clamp(maxEdgeC*1.5, 0.0, 1.0);
	float addC3 = clamp(maxEdgeC*2.0, 0.0, 1.0);
	float addAll = addC1+addC2+addC3;
	ringCl += vec3(0.2, 0.3, 0.5+(addAll*0.25))*addAll;
	ringCl_F = (ringCl_F*hazeScale)+(addAll*0.5);
#endif

#ifdef USE_MELTED
	ringCl_F *= hazeScale;
#endif
	
	vec4 endCol = vec4(ringCl, pow(clamp(ringCl_F, 0.0, 1.0), 1.0)*(pow(frenD, inAtmoFade.x)*inAtmoFade.y));
	endCol.rgb = pow(endCol.rgb, vec3(inFinalGama))*inFinalGama.a;
	
	finalCol0 = (endCol+inAddLight)*inFade*getBackExp();
}
