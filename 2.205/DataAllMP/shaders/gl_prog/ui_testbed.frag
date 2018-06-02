#version 330

smooth in vec2 outUV0;

uniform sampler2D inTex;
uniform vec4 inTint;
uniform vec4 inTime;
uniform vec4 inMouse;
uniform vec2 inBlend;
uniform vec2 inRateA;
uniform vec2 inRateB;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec2 shiftUV0 = vec2(fract(outUV0.x+(inTime.x*inRateA.x)), fract(outUV0.y+(inTime.x*inRateB.x)));
	vec4 tex0 = texture(inTex, shiftUV0);
	vec4 tmp = tex0*inTint;
	finalCol0 = vec4(mix(tmp.x, inMouse.y, inRateA.y), inMouse.x, 1.0, tmp.y*inBlend.x);
}
