smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexColor;
uniform sampler2D inTexDepth;

uniform vec4 inMouse;
uniform vec4 inWindow;
uniform vec4 inDepth;
uniform vec4 inTime;

uniform vec4 inLightSrc;
uniform vec4 inMaskScale;
uniform vec4 inMaskMotion;

layout (location = 0) out vec4 finalCol0;

float obscured(vec2 pos)
{
	return 1.0-min(max(0.0, inLightSrc.z-texture(inTexDepth,pos).x)*1000.0, 1.0);
}

void main() 
{
	vec2 srcPix = vec2(inLightSrc.x*inWindow.x, inLightSrc.y*inWindow.y);
	vec2 nowPix = vec2(outUV0.x*inWindow.x, outUV0.y*inWindow.y);
	
	vec2 deltPix = srcPix-nowPix;
	float deltLen = length(deltPix);
	
	float deltAng = atan(deltPix.y, deltPix.x);
	
	float beam0 = HELP_Noise3(vec3(sin(deltAng)*0.25, cos(deltAng)*0.25, inTime.x*inMaskMotion.x))+1.0;
	float beam1 = HELP_Noise3(vec3(sin(deltAng)*0.837, cos(deltAng)*0.82, inTime.x*inMaskMotion.y))+1.0;
	float beams = (beam0+beam1)*0.25;
	float distBeam = pow(beams, inMaskScale.w);
	
	float effectIn = inMaskScale.x;
	float effectOut = mix(inMaskScale.y, inMaskScale.z, distBeam);
	float effectWindow = effectOut-effectIn;
	float effectCurve = mix(inMaskMotion.z, inMaskMotion.w, distBeam);
	
	float falloff = 1.0-clamp((deltLen-effectIn)/effectWindow, 0.0, 1.0);
	falloff = pow(falloff, effectCurve);
	
	finalCol0.rgb = texture(inTexColor,outUV0).rgb*obscured(outUV0)*falloff;
	finalCol0.a = 1.0;
}