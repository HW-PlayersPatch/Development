#version 330

layout (location = 0) in vec4 inPos;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inOfs;
uniform vec4 inWindow;

uniform vec4 inMult;
uniform vec4 inTint;

smooth out vec4 outCol0;

void main()
{
	mat4 PVM = inMatP*inMatC*inMatMV;
    
	vec4 tryV = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	tryV.x += (inOfs.x*2.0*inWindow.z)*tryV.w;
	tryV.y += (inOfs.y*2.0*inWindow.w)*tryV.w;
	gl_Position = tryV;
	outCol0 = inMult*inTint;
}
