layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;
layout (location = 7) in vec2 inUV1;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inTime;
uniform vec4 inFXInfo[2];

#ifdef FX_SCISSOR
smooth out float outScissor;
#endif

smooth out vec4 outCol1;
smooth out vec2 outUV0;
smooth out vec2 outUV1;
smooth out vec2 outUV2;
smooth out vec3 outNorm_W;
smooth out vec3 outEye_W;

void main()
{
	vec3 usePos = inPos;
	vec4 axisPos = vec4(0.0, 0.0, inPos.z, 1.0);	// Center of tube
	vec4 axisW = inMatMV*axisPos;
	float axisDist = length(axisW.xyz-axisPos.w)*0.03;
	
	float rotDist = axisDist*1000.0;
	usePos.x = (inPos.x*cos(rotDist))-(inPos.y*sin(rotDist));
	usePos.y = (inPos.y*cos(rotDist))+(inPos.x*sin(rotDist));
	
	float timeDist = inTime.z*2.1;
	
	float oct0 = sin((axisDist+timeDist)*0.085)*1.5;
	float oct1 = cos(((axisDist*1.7)+timeDist*1.15)*0.053);
	float oct2 = sin(((axisDist*0.62)+timeDist*1.5)*0.0219)*0.5;
	float boost = ((oct0+oct1+oct2)/6.0)+0.5;
	float shift = 0.8+(boost*0.3);
	
	vec3 showPos = vec3(inPos.x*shift, inPos.y*shift, inPos.z);
	
	mat4 invC = inverse(inMatC);
	vec4 useNormW = inMatMV*vec4(inNorm.xyz, 0.0);
	outNorm_W = useNormW.xyz;
	vec4 usePosW = inMatMV*vec4(showPos.xyz, 1.0);
	outEye_W = usePosW.xyz-invC[3].xyz;
	
	vec4 posT = inMatP*inMatC*inMatMV*vec4(showPos.xyz, 1.0);
	
	gl_Position = posT;
	
	vec2 uvScroll1 = vec2(inTime.z*0.03, inTime.z*0.027);
	vec2 uvScroll2 = vec2(inTime.z*0.009, inTime.z*0.012);
	
	outCol1 = inCol0;
	outUV0 = inUV0;
	outUV1 = (inUV1*8.0)+uvScroll1;
	outUV2 = (inUV1*2.7)-uvScroll2;
}