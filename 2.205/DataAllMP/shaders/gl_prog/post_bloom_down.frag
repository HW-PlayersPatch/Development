#version 330

smooth in vec2 outUV0;

uniform sampler2D inTexColor;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	vec2 tS = textureSize(inTexColor,0);
	float stepX = 1.0/tS.x;
	float stepY = 1.0/tS.y;
	
	float minX = outUV0.x-(stepX*0.5);
	float minY = outUV0.y-(stepY*0.5);
	float maxX = minX+(2.0*stepX);
	float maxY = minY+(2.0*stepY);
	
	vec3 tex00 = texture(inTexColor,vec2(minX, minY)).rgb;
	vec3 tex10 = texture(inTexColor,vec2(maxX, minY)).rgb;
	vec3 tex01 = texture(inTexColor,vec2(minX, maxY)).rgb;
	vec3 tex11 = texture(inTexColor,vec2(maxX, maxY)).rgb;
	
	vec3 texRGB = (tex00+tex10+tex01+tex11)*0.25;
	
	finalCol0.rgb = texRGB;
	finalCol0.a = 1.0;
}