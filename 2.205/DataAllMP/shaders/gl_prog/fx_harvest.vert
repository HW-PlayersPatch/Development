layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatMV;
uniform mat4 inMatC;
uniform mat4 inMatP;

uniform vec4 inTime;
uniform vec4 inAlphaMode;
uniform vec4 inFXInfo[2];

uniform vec4 inBeamAnim;

#ifdef FX_SCISSOR
smooth out float outScissor;
#endif

smooth out vec4 outCol0;
smooth out vec2 outUV00;
smooth out vec2 outUV01;

void main()
{
	float useTime = inTime.z;
	float coneDist = length(inPos.xyz);
	float coneS1 = (sin((coneDist*0.5)+(useTime*-3.7))+1.0)*0.5;
	float coneC1 = (cos((coneDist*0.4)+(useTime*-4.45))+1.0)*0.5;
	
	float pulseTime = abs(1.0-(fract((useTime*inBeamAnim.y)+(coneDist*0.01))*2.0));
	pulseTime = pow(max(min(1.0, pulseTime*1.1)-0.9, 0.0)*10.0, 0.5);
	
	float pulseTime2 = abs(1.0-(fract((useTime*inBeamAnim.y*2.0)+((coneDist+50.0)*0.01))*2.0));
	pulseTime2 = pow(max(min(1.0, pulseTime2*1.1)-0.9, 0.0)*10.0, 0.5);
	
	float coneFactor = clamp(coneDist/50.0, 0.0, 1.0);
	coneFactor = pow(coneFactor, 0.5);
	
	float scaleNoise = (coneS1+coneC1)*inBeamAnim.x;
	float scalePulse = max(pulseTime, pulseTime2)*inBeamAnim.w;
	float scaleFact = mix(1.0, 1.0+max(scaleNoise,scalePulse), coneFactor);
	
	gl_Position = inMatP*inMatC*inMatMV*vec4(inPos.x*scaleFact, inPos.y*scaleFact, inPos.z, 1.0);
	
	vec4 useCol = inFXInfo[0];
	useCol.a = pow(min(1, useCol.a/inAlphaMode.x), inAlphaMode.y);
	
#ifdef FX_SCISSOR
	outScissor = mix(0.5, 1.0-useCol.a, inAlphaMode.y);
#endif

	outCol0 = useCol*inCol0;
	outCol0.xyz += vec3(scalePulse*inBeamAnim.z)*inCol0.rgb;
	outUV00 = vec2(inUV0.x, inUV0.y-(useTime*0.35));
	outUV01 = vec2(inUV0.x-0.5, inUV0.y-(useTime*0.82));
}