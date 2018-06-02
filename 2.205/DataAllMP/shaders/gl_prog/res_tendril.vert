layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inTime;
uniform vec4 inFXInfo[2];

#ifdef FX_SCISSOR
smooth out float outScissor;
#endif

smooth out vec4 outAnim;
smooth out vec4 outCol0;
smooth out vec4 outCol1;
smooth out vec2 outUV0;
smooth out vec3 outNorm_W;
smooth out vec3 outPos_W;
smooth out vec3 outEye_W;

void main()
{
	float axisAng = atan(inPos.y, inPos.x);			// Angle 'around' tube
	vec4 axisPos = vec4(0.0, 0.0, inPos.z, 1.0);	// Center of tube
	vec4 axisW = inMatMV*axisPos;
	float axisDist = length(axisW.xyz-axisPos.w)*0.1;
	float timeDist = inTime.z*2.139;
	
	float oct0 = sin(axisAng+((axisDist+timeDist)*0.085))*1.5;
	float oct1 = cos(axisAng+(((axisDist*1.7)+timeDist*1.25)*0.053));
	float oct2 = sin(axisAng+(((axisDist*0.62)+timeDist*1.5)*0.0219))*0.5;
	float boost = ((oct0+oct1+oct2)/6.0)+0.5;
	float shift = 0.5+(boost*1.0);
	
	vec3 showPos = vec3(inPos.x*shift, inPos.y*shift, inPos.z);
	
	mat4 invC = inverse(inMatC);
	vec4 useNormW = inMatMV*vec4(inNorm.xyz, 0.0);
	outNorm_W = useNormW.xyz;
	vec4 usePosW = inMatMV*vec4(showPos.xyz, 1.0);
	outPos_W = usePosW.xyz;
	outEye_W = outPos_W-invC[3].xyz;
	
	outAnim = vec4(0.0);
	outAnim.x = (inPos.z+100.0)/200.0;
	
	vec4 posT = inMatP*inMatC*inMatMV*vec4(showPos.xyz, 1.0);
	
	gl_Position = posT;
	
	vec4 useCol = inFXInfo[0];
	outCol0 = useCol;
	outCol1 = inCol0;
	outUV0 = inUV0;
}