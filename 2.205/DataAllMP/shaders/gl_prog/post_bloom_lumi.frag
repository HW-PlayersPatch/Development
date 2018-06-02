smooth in vec2 outUV0;

uniform sampler2D inTexColor;

uniform vec3 inLumiMap;
uniform vec3 inLumiIn;

layout (location = 0) out vec4 finalCol0;

vec3 configLumi = inLumiMap;
float configInThresh = inLumiIn.x;
float configInBoost = inLumiIn.y;
float configInCurve = inLumiIn.z;

vec3 CALC_ThreshSample(vec3 preThresh)
{
	float lumiRaw = dot(preThresh, configLumi);
	float lumiThresh = pow(clamp((lumiRaw-configInThresh)/(1.0-configInThresh)*configInBoost, 0.0, 1.0), configInCurve);
	return preThresh*lumiThresh;
}

void main() 
{	
	vec3 outRGB = vec3(0.0);
	
#ifdef FOURBYFOUR
	vec2 tS = textureSize(inTexColor,0);
	float stepX = 1.0/tS.x;
	float stepY = 1.0/tS.y;
		
	float minX = outUV0.x-(stepX*0.5);
	float minY = outUV0.y-(stepY*0.5);
	float maxX = minX+(2.0*stepX);
	float maxY = minY+(2.0*stepY);
				
	vec3 tex00 = CALC_ThreshSample(texture(inTexColor,vec2(minX, minY)).rgb);
	vec3 tex10 = CALC_ThreshSample(texture(inTexColor,vec2(maxX, minY)).rgb);
	vec3 tex01 = CALC_ThreshSample(texture(inTexColor,vec2(minX, maxY)).rgb);
	vec3 tex11 = CALC_ThreshSample(texture(inTexColor,vec2(maxX, maxY)).rgb);

	outRGB = (tex00+tex10+tex01+tex11)/4.0;
#else
	outRGB = CALC_ThreshSample(texture(inTexColor,outUV0).rgb);
#endif
	
	finalCol0.rgb = outRGB;
	finalCol0.a = 1.0;
}