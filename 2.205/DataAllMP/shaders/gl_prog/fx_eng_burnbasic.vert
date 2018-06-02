layout (location = 0) in vec4 inPos;
layout (location = 1) in vec4 inNorm;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatV;
uniform mat4 inMatP;
uniform vec4 inCamera;

smooth out vec4 outCol0;
smooth out vec2 outUV0;

#ifdef DEPTH_BIAS
uniform vec4 inDepth;
smooth out float outOfs;
smooth out float outPush;
#endif

void main()
{
	float ofsX = inPos.w*mix(1.0, -1.0, inUV0.y);
	float ofsY = inPos.w*mix(1.0, -1.0, inUV0.x);
	
	vec3 usePos = inPos.xyz;
	vec3 useOfs = vec3(ofsX, ofsY, 0.0);
	
	vec3 eyeZ = normalize(usePos-inCamera.xyz);
	
	vec3 billU = vec3(inMatV[0].y, inMatV[1].y, inMatV[2].y);
	vec3 billZ = eyeZ;
	vec3 billX = normalize(cross(billU, billZ));
	vec3 billY = cross(billZ, billX);
		
	mat3 billB;
	billB[0] = billX;
	billB[1] = billY;
	billB[2] = billZ;
		
	useOfs = billB*useOfs;
	
	vec3 centerPos = usePos;
	usePos += useOfs;
	
	float fadeFactor = (dot(eyeZ, inNorm.xyz)*-0.5)+0.5;
	fadeFactor = inNorm.w+(fadeFactor*(1.0-inNorm.w));
	
#ifdef DEPTH_BIAS
	vec3 pullVec = inCamera.xyz-usePos;			// Pull vert towards camera
	vec3 centerVec = inCamera.xyz-centerPos;	// Use ring center for distance (closest point with billboarding)
	float centerLenFull = length(centerVec);
	float centerLenTrim = max(0.0, centerLenFull-(inDepth.x*2.0));
	float pullPercent = centerLenTrim/centerLenFull;
	float pullMax = length(pullVec)*pullPercent;	// Max distance we can pull
	pullVec = normalize(pullVec);
	
	float ringDepth = inPos.w*0.25;						// How 'deep' is the ring? Tuned 'thin' a bit...
	float pullDeg = min(ringDepth, pullMax);			// Choose the smaller offset
	usePos += pullVec*pullDeg;
	outOfs = ringDepth;
	outPush = pullDeg;
#endif
	
	vec4 posT = inMatV*vec4(usePos, 1.0);
	gl_Position = inMatP*posT;
		
	outCol0 = inCol0;
	outCol0.a *= fadeFactor;
	outUV0 = inUV0;
}