layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 2) in vec3 inTan;
layout (location = 3) in vec3 inBiNorm;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

uniform vec4 inClipPlane;

#ifdef SOB_SHADOWS_ON
	uniform mat4 inMatKL;
	uniform vec4 inShadowTrans[4];
	smooth out vec3 outPos_KL;

	#ifdef SOB_SHADOWS_DUAL
		uniform mat4 inMatFL;
		smooth out vec3 outPos_FL;
	#endif
#endif

smooth out vec2 outUV0;
smooth out vec2 outUV1;
smooth out vec3 outNorm;
smooth out vec3 outTan;
smooth out vec3 outBiNorm;
smooth out vec3 outPos_W;
smooth out vec3 outEye_W;

#ifdef PATCH_ALTHYPER
	smooth out float outClipD;
#endif

void main()
{
	mat4 invV = inverse(inMatV);
	vec4 posW4 = inMatM*vec4(inPos, 1.0);
	outPos_W = posW4.xyz;
	outEye_W = outPos_W-invV[3].xyz;	// World-space for reflections/etc
	
#ifdef SOB_SHADOWS_ON
	vec3 posL = (inMatKL*posW4).xyz;
	vec3 litBuf = (posL*inShadowTrans[1].xyz)+inShadowTrans[0].xyz;
	outPos_KL = litBuf;
	
	#ifdef SOB_SHADOWS_DUAL
		posL = (inMatFL*posW4).xyz;
		litBuf = (posL*inShadowTrans[3].xyz)+inShadowTrans[2].xyz;
		outPos_FL = litBuf;
	#endif

#endif
	
	outNorm = inNorm;
	outTan = inTan;
	outBiNorm = inBiNorm;
	outUV0 = inUV0;	
	outUV1 = inUV1;

	mat4 VP = inMatP*inMatV;
	gl_Position = VP*posW4;			// Clip-space vert for geo/rasterize
	
#ifdef PATCH_ALTHYPER
	outClipD = dot(inClipPlane, vec4(outPos_W, 1.0));
#else
	gl_ClipDistance[0] = dot(inClipPlane, vec4(outPos_W, 1.0));
#endif
}
