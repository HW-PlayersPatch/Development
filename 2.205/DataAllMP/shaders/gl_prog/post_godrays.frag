#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexColor;
uniform sampler2D inTexDepth;

uniform vec4 inMouse;
uniform vec4 inWindow;
uniform vec4 inDepth;

uniform vec4 inLightSrc;
uniform vec3 inLightParams;
uniform vec3 inLightSteps;

layout (location = 0) out vec4 finalCol0;

float znear = inDepth.x; //camera clipping start
float zfar = inDepth.y; //camera clipping end

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));

	return ret/100.0;
}

float obscured(vec2 pos)
{
	return 1.0-min(max(0.0, inLightSrc.z-texture(inTexDepth,pos).x)*1000.0, 1.0);
}

void main() 
{
	vec3 glow = vec3(0.0);
	vec2 srcPos = vec2(inLightSrc.xy);
	vec2 nowPos = vec2(outUV0);
	vec2 deltPos = nowPos-srcPos;
	float deltLen = length(deltPos)*(0.2+(inLightSrc.w*0.8));
	
	float lenAdj = pow(clamp(deltLen/0.8, 0.0, 1.0), inLightSteps.z);
	float fSteps = mix(inLightSteps.x, inLightSteps.y, lenAdj);
	
	float lenStep = deltLen/fSteps;
	vec2 deltStep = deltPos/fSteps;
	float curLen = 0.0;
	vec2 curPos = srcPos;
	
	float sampleWeight = (1.0/fSteps)*inLightParams.x;
	float thisStep = min(1.0, fSteps);
	
	while (fSteps > 0)
	{
		vec3 backLight = max((texture(inTexColor,curPos).xyz-0.95)*20.0, 0.0);
		backLight *= sampleWeight*obscured(curPos);
		backLight *= pow(curLen/deltLen, inLightParams.y);
		
		glow += backLight*thisStep;
		
		fSteps -= 1.0;
		thisStep = min(1.0, fSteps);
		curPos += deltStep*thisStep;
		curLen += lenStep*thisStep;
	}
	
	finalCol0.rgb = glow*inLightParams.z*inLightSrc.w;
	finalCol0.a = 1.0;
}