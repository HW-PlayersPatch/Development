layout (location = 0) out vec4 finalCol0;

#ifdef PATCH_ALTHYPER
	smooth in float outClipD;
#endif

void main()
{
#ifdef PATCH_ALTHYPER
	if (outClipD <= 0.0)
	{
		discard;
	}
#endif

	finalCol0 = vec4(0.0);
}
