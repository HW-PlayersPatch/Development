#version 330

layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;

uniform mat4 inMatP;
uniform mat4 inMatMV;

uniform vec4 inOfs;
uniform vec4 inWindow;
uniform vec4 inMult;

smooth out vec4 outCol0;

void main()
{
	mat4 PVM = inMatP*inMatMV;
	vec4 tryV = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	tryV.x += (inOfs.x*2.0*inWindow.z)*tryV.w;
	tryV.y += (inOfs.y*2.0*inWindow.w)*tryV.w;
	gl_Position = tryV;
	outCol0 = inCol0*inMult;
}
