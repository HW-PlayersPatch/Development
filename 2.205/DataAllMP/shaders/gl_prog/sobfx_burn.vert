layout (location = 0) in vec3 inPos;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;
layout (location = 8) in vec2 inUV2;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

uniform vec4 inClipPlane;

uniform vec4 inShadowTrans;

smooth out vec2 outUV0;
smooth out vec2 outUV1;
smooth out vec2 outUV2;
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
	
	outUV0 = inUV0;	
	outUV1 = inUV1;
	outUV2 = inUV2;

	mat4 VP = inMatP*inMatV;
	gl_Position = VP*posW4;			// Clip-space vert for geo/rasterize
	
#ifdef PATCH_ALTHYPER
	outClipD = dot(inClipPlane, vec4(outPos_W, 1.0));
#else
	gl_ClipDistance[0] = dot(inClipPlane, vec4(outPos_W, 1.0));
#endif
}
