#version 330

layout (location = 0) in vec3 inPos;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatMV;
uniform mat4 inMatP;

smooth out vec2 outUV0;

void main()
{
	mat4 PVM = inMatP*inMatMV;
    
	gl_Position = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	outUV0 = inUV0;
}
