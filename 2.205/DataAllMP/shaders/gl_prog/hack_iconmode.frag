#version 330

smooth in vec2 outUV0;
smooth in vec3 outNorm;
smooth in vec3 outTan;
smooth in vec3 outBiNorm;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

uniform sampler2D inTexDiff;
uniform sampler2D inTexGlow;

uniform sampler2D inTexNorm;
uniform samplerCube inTexEnv0;
uniform samplerCube inTexEnv1;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec3 texDiff = texture(inTexDiff, outUV0).rgb;
	float texGlow = texture(inTexGlow, outUV0).g;
	
	texGlow *= (texDiff.r*0.299)+(texDiff.g*0.587)+(texDiff.b*0.114);
	
	vec3 texNorm = texture(inTexNorm, outUV0).rgb;
	
	float texLum = (texNorm.r*0.299)+(texNorm.g*0.587)+(texNorm.b*0.114);
	
	if (texLum >= 0.52)
	{
		texLum = 0.0;
	}
	else
	{
		texLum = 1.0;
	}
	
	texLum += texGlow;
	
	finalCol0.rgb = vec3(texLum);
	finalCol0.a = 1.0;
}
