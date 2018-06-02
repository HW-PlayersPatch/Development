layout (location = 0) in vec3 inPos;

#ifdef USE_NORMS
layout (location = 1) in vec3 inNorm;
layout (location = 2) in vec3 inTan;
layout (location = 3) in vec3 inBiNorm;
#endif

layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec3 inBlends;
uniform vec4 inTime;
uniform vec2 inMoveWarp;

smooth out vec4 outCol0;
smooth out vec2 outUV0;
smooth out vec2 outUV1;

#ifdef USE_NORMS
smooth out vec3 outNorm;
smooth out vec3 outTan;
smooth out vec3 outBiNorm;
#endif

void main()
{
	outCol0 = mix(vec4(0.5, 0.5, 0.5, 1.0), inCol0, inBlends.x)*inBlends.y;
	outUV0 = inUV0;
	
	vec2 ofsWarp = vec2(fract(inTime.z*inMoveWarp.x), fract(inTime.z*inMoveWarp.y));
	outUV1 = inUV1+ofsWarp;
	
#ifdef USE_NORMS
	outNorm = inNorm;
	outTan = inTan;
	outBiNorm = inBiNorm;
#endif
	
	gl_Position = inMatP*inMatC*inMatMV*vec4(inPos, 1.0);	
}
