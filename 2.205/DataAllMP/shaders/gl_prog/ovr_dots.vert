#version 330

layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;

uniform mat4 inMatMV;
uniform mat4 inMatP;

smooth out vec4 outCol0;

void main()
{
	mat4 PVM = inMatP*inMatMV;
    
	vec4 posV = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	gl_Position = posV;
	gl_PointSize = inPos.w;
	outCol0 = inCol0;
}
