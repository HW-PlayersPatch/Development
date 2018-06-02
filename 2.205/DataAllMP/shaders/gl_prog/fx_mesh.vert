layout (location = 0) in vec4 inPos;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inAlphaMode;
uniform vec4 inFXInfo[2];

#ifdef FX_SCISSOR
smooth out float outScissor;
#endif

smooth out vec4 outCol0;
smooth out vec2 outUV0;

void main()
{
	vec4 posT = inMatP*inMatC*inMatMV*vec4(inPos.xyz, 1.0);
		
	gl_Position = posT;
	
	vec4 useCol = inFXInfo[0];
	useCol.a = pow(min(1, useCol.a/inAlphaMode.x), inAlphaMode.y);
	
#ifdef FX_SCISSOR
	outScissor = mix(0.5, 1.0-useCol.a, inAlphaMode.y);
#endif

	outCol0 = useCol;
	outUV0 = inUV0;
}