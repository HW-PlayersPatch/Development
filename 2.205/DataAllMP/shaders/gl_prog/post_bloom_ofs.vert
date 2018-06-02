#version 330

layout (location = 0) in vec4 inPos;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatMV;
uniform mat4 inMatP;

uniform vec4 inWindow;
uniform vec2 inAxis;
uniform vec2 inSpace;

smooth out vec2 outUV0;
smooth out vec2 outUV1;

smooth out vec2 outGSN4;
smooth out vec2 outGSN3;
smooth out vec2 outGSN2;
smooth out vec2 outGSN1;
smooth out vec2 outGSC0;
smooth out vec2 outGSP1;
smooth out vec2 outGSP2;
smooth out vec2 outGSP3;
smooth out vec2 outGSP4;

vec2 CALC_Ofs(float hi, float lo, float ofs, float dir)
{
	float rel = lo/(lo+hi);
	float shift = (ofs+rel)*dir;
	
	return vec2(shift*inWindow.z*inAxis.x, shift*inWindow.w*inAxis.y);
}

void main()
{
	mat4 PVM = inMatP*inMatMV;
	gl_Position = PVM*vec4(inPos.x, inPos.y, inPos.z, 1.0f);
	
	float coefs[9] = float[](0.106417485, 0.102930494, 0.0931286216, 0.0787829310, 0.0622702129, 0.0459342860, 0.0315769911, 0.0201901495, 0.0119775245);
	
	outUV0 = inUV0;
	outUV1 = inUV1;
	
	outGSN4 = inUV0+CALC_Ofs(coefs[7], coefs[8], 7, -1.0);
	outGSN3 = inUV0+CALC_Ofs(coefs[5], coefs[6], 5, -1.0);
	outGSN2 = inUV0+CALC_Ofs(coefs[3], coefs[4], 3, -1.0);
	outGSN1 = inUV0+CALC_Ofs(coefs[1], coefs[2], 1, -1.0);
	outGSC0 = inUV0;
	outGSP1 = inUV0+CALC_Ofs(coefs[1], coefs[2], 1, 1.0);
	outGSP2 = inUV0+CALC_Ofs(coefs[3], coefs[4], 3, 1.0);
	outGSP3 = inUV0+CALC_Ofs(coefs[5], coefs[6], 5, 1.0);
	outGSP4 = inUV0+CALC_Ofs(coefs[7], coefs[8], 7, 1.0);		
}
