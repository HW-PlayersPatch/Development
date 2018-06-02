layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;
layout (location = 10) in vec4 inMisc0;
layout (location = 11) in vec4 inMisc1;

uniform mat4 inMatV;
uniform mat4 inMatP;
uniform vec4 inCamera;

smooth out vec4 outCol0;
smooth out vec2 outUV0;
smooth out vec2 outUV1;

#ifdef DEPTH_BIAS
uniform vec4 inDepth;
smooth out float outOfs;
smooth out float outPush;
#endif

void main()
{
	vec2 inUV1 = vec2(inMisc1.x, inMisc1.y);
	vec3 usePos = inPos.xyz;
	vec3 useOfs = inMisc0.xyz;
	
	vec3 eyeZ = normalize(usePos-inCamera.xyz);
	usePos -= eyeZ*inMisc1.w;	// FX forced depth offset
	
	if (inMisc0.w > 0.0)	// Billboard?
	{
		vec3 billU = vec3(inMatV[0].y, inMatV[1].y, inMatV[2].y);
		vec3 billZ = eyeZ;
		vec3 billX = normalize(cross(billU, billZ));
		vec3 billY = cross(billZ, billX);
		
		mat3 billB;
		billB[0] = billX;
		billB[1] = billY;
		billB[2] = billZ;
		
		useOfs = billB*useOfs;
	}
	
	vec3 centerPos = usePos;
	usePos += useOfs;
	
#ifdef DEPTH_BIAS
	vec3 pullVec = inCamera.xyz-usePos;			// Pull vert towards camera
	vec3 centerVec = inCamera.xyz-centerPos;	// Use ring center for distance (closest point with billboarding)
	float centerLenFull = length(centerVec);
	float centerLenTrim = max(0.0, centerLenFull-(inDepth.x*2.0));
	float pullPercent = centerLenTrim/centerLenFull;
	float pullMax = length(pullVec)*pullPercent;	// Max distance we can pull
	pullVec = normalize(pullVec);
	
	float ringDepth = inPos.w;							// How 'deep' is the ring? (half)
	float pullDeg = min(ringDepth, pullMax);			// Choose the smaller offset
	usePos += pullVec*(pullDeg*inUV1.y);
	outOfs = ringDepth;
	outPush = pullDeg;
#endif
	
	vec4 posT = inMatV*vec4(usePos, 1.0);
	gl_Position = inMatP*posT;
	
	outCol0 = inCol0;
	outUV0 = inUV0;
	outUV1 = inUV1;
}