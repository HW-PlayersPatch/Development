layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inWindow;

uniform vec4 inAtmoInfo;

//smooth out vec4 outAtmo;
smooth out vec3 outNorm;
smooth out vec3 outNorm_W;
smooth out vec3 outPos_W;
smooth out vec3 outEye_W;

#ifdef USE_MELT
smooth out vec3 outPos;
#endif

void main()
{
	outNorm = inNorm;
	
	float ofsLen = length(inPos)*inAtmoInfo.x;
	
	vec3 ofsPos = inPos+(inNorm*ofsLen);
	vec4 pos4 = vec4(ofsPos, 1.0);
	vec4 nrm4 = vec4(inNorm, 0.0);
	
	mat4 invC = inverse(inMatC);
	
	vec4 nrmW4 = inMatMV*nrm4;
	outNorm_W = nrmW4.xyz;
	
	vec4 posW4 = inMatMV*pos4;
	outPos_W = posW4.xyz;
	outEye_W = outPos_W-invC[3].xyz;	// World-space for reflections/etc
	
#ifdef USE_MELT
	outPos = inPos;
#endif
	
	mat4 VP = inMatP*inMatC;
	gl_Position = VP*posW4;
}
