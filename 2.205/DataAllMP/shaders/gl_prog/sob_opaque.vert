layout (location = 0) in vec3 inPos;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

uniform vec4 inClipPlane;

#ifdef PATCH_ALTHYPER
	smooth out float outClipD;
#endif

void main()
{
	vec4 posW4 = inMatM*vec4(inPos, 1.0f);
	mat4 VP = inMatP*inMatV;
	gl_Position = VP*posW4;			// Clip-space vert for geo/rasterize
	
#ifdef PATCH_ALTHYPER
	outClipD = dot(inClipPlane, posW4);
#else
	gl_ClipDistance[0] = dot(inClipPlane, posW4);
#endif
}
