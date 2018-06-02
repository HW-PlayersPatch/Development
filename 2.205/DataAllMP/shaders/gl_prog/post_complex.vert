#version 330

layout (location = 0) in vec4 inPos;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatMV;
uniform mat4 inMatP;

uniform vec4 inTime;

smooth out vec2 outUV0;
smooth out vec2 outUV1;
smooth out float outTimeOfs;

void main()
{
	mat4 PVM = inMatP*inMatMV;
	gl_Position = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	
	outTimeOfs = fract(inTime.x*0.1)*10.0;
	
	outUV0 = inUV0;
	outUV1 = inUV1;
}
