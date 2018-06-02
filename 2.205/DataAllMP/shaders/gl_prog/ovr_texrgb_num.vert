layout (location = 0) in vec3 inPos;
layout (location = 6) in vec2 inUV0;

smooth out vec2 outUV0;
smooth out vec4 outPosW;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inCamera;

void main()
{
	outPosW = inMatMV*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	
	mat4 PMV = inMatP*inMatC*inMatMV;
	gl_Position = PMV*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	outUV0 = inUV0;
}
