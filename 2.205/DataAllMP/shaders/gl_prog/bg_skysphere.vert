#version 330

layout (location = 0) in vec3 inPos;
layout (location = 4) in vec4 inCol0;

uniform mat4 inMatMV;
uniform mat4 inMatP;

smooth out vec4 outCol0;

void main()
{
	mat4 PVM = inMatP*inMatMV;
    
	gl_Position = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	outCol0 = inCol0;
}
