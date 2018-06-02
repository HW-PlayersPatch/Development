layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatV;
uniform mat4 inMatP;

smooth out vec4 outCol0;
smooth out vec2 outUV0;
smooth out vec2 outUV1;

void main()
{
	vec4 posT = inMatV*vec4(inPos.xyz, 1.0);
	vec4 posXY = inMatP*posT;
	
	gl_Position = posXY;
	
	outCol0 = inCol0;
	outUV0 = inUV0;
	outUV1 = inUV1;
}