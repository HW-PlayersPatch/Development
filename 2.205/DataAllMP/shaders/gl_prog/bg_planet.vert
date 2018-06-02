layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 2) in vec3 inTan;
layout (location = 3) in vec3 inBiNorm;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;
uniform vec4 inTime;

smooth out vec2 outUV0;
smooth out vec3 outNorm;
smooth out vec3 outTan;
smooth out vec3 outBiNorm;
smooth out vec3 outPos_W;
smooth out vec3 outEye_W;

#ifdef GLOW_ANIM
smooth out vec3 outPos;
#endif

#ifdef USE_MELT
smooth out vec3 outPos;
#endif

void main()
{
	vec4 pos4 = vec4(inPos, 1.0);
	
	mat4 invC = inverse(inMatC);
	vec4 posW4 = inMatMV*pos4;
	outPos_W = posW4.xyz;
	outEye_W = outPos_W-invC[3].xyz;	// World-space for reflections/etc
	
	outNorm = inNorm;
	outTan = inTan;
	outBiNorm = inBiNorm;
	outUV0 = inUV0;
	
#ifdef USE_MELT
	outPos = inPos;
#endif

#ifdef GLOW_ANIM
	outPos = inPos;
#endif

	vec4 VPtemp = inMatC*posW4;
	gl_Position = inMatP*VPtemp;
	
//	mat4 VP = inMatP*inMatC;
//	gl_Position = VP*posW4;	
}
