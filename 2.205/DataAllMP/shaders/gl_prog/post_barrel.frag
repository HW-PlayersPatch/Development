#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexScene;

uniform vec4 inWindow;
uniform vec4 inTime;
uniform vec4 inMouse;

uniform vec4 inLens;

layout (location = 0) out vec4 finalCol0;

float calcBarrel(vec2 pos, vec3 factors)
{
	vec2 pos2 = pos*pos;
	float rad2 = pos2.x+pos2.y;

	float ret =
		(factors.x)+
		(factors.y*rad2)+
		(factors.y*rad2*rad2);
//		(factors.y*rad2*rad2*rad2);

	return ret;
}

void main()
{
	vec2 uvOfs = outUV0;
	
	float lensOfs = -0.0625*0.5;
	vec2 lensCenOut = vec2(0.25, 0.5);
	vec2 lensAspect = vec2(inLens.y, 1.0);
	
	lensAspect.x *= 0.5;
	if (outUV0.x >= 0.5)
	{
		lensCenOut.x += 0.5;
	}
	else
	{
		lensOfs *= -1.0;
	}
	
	vec2 lensCenIn = lensCenOut;
	lensCenIn.x += lensOfs;
	
	vec4 scaleIn = vec4(1.0, 1.013, 1.032, 1.0);  // eye relief in
	vec4 scaleOut = vec4(1.0, 1.017, 1.038, 1.0);  // eye relief out
	vec4 rgbFix=mix(scaleIn, scaleOut, 0.25);
	
	// Into barrel
	uvOfs -= lensCenIn;
	uvOfs *= lensAspect;
	
	float barrelFix = calcBarrel(uvOfs, vec3(1.0, inLens.z, inLens.w));
	
	vec2 ofsR = lensCenOut+((uvOfs*barrelFix*rgbFix.r)/lensAspect);
	vec2 ofsG = lensCenOut+((uvOfs*barrelFix*rgbFix.g)/lensAspect);
	vec2 ofsB = lensCenOut+((uvOfs*barrelFix*rgbFix.b)/lensAspect);
	
	// Right back out...
	uvOfs /= lensAspect;
	uvOfs += lensCenOut;
	
	vec4 texSceneR = texture(inTexScene, ofsR);
	vec4 texSceneG = texture(inTexScene, ofsG);
	vec4 texSceneB = texture(inTexScene, ofsB);
	finalCol0 = vec4(texSceneR.r, texSceneG.g, texSceneB.b, 1.0);
}
