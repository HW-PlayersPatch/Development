#version 330

smooth in vec2 outUV0;

uniform sampler2D inTexColor;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	vec2 tS = textureSize(inTexColor,0);
	float stepX = 1.0/tS.x;
	
	float minX = outUV0.x-(stepX*0.5);
	float maxX = minX+(2.0*stepX);
	
	vec3 tex0 = texture(inTexColor,vec2(minX, outUV0.y)).rgb;
	vec3 tex1 = texture(inTexColor,vec2(maxX, outUV0.y)).rgb;
	
	vec3 texRGB = (tex0+tex1)*0.5;
	
	finalCol0.rgb = texRGB;
	finalCol0.a = 1.0;
}