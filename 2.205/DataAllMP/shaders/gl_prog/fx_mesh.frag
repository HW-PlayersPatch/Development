#ifdef FX_SCISSOR
smooth in float outScissor;
#endif

smooth in vec4 outCol0;
smooth in vec2 outUV0;

uniform sampler2D inTexFx;

uniform vec4 inFXInfo[2];

layout (location = 0) out vec4 finalCol0;

#ifdef DEPTH_BIAS
uniform sampler2D inTexDepth;
uniform vec4 inWindow;
uniform vec4 inDepth;

float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));
	return ret;
}
#endif

void main()
{
	vec4 fxTex = texture(inTexFx, outUV0);
	
#ifdef FX_SCISSOR
	if (fxTex.a < outScissor)
	{
		discard;
	}
#endif

	fxTex.rgb *= 2.0;
	vec4 fxCol = fxTex*outCol0;
	
#ifdef DEPTH_BIAS
	float biasWindow = 5.0;
	vec2 uvD = gl_FragCoord.xy*inWindow.zw;
	float depthB = linearize(texture(inTexDepth, uvD).x);
	float depthF = linearize(gl_FragCoord.z);
	float depthO = clamp((depthB-depthF)/biasWindow, 1.0-inFXInfo[1].y, 1.0);
	
	// This isn't correct (darking RGB on alpha blend) - but it _looks_ great with most alpha textures
	// Smoke grows dark against surfaces as it fades, etc.  So let's keep it...
	fxCol.rgb = fxCol.rgb*depthO;
	
	// This is the correct math - which we'll disable
	//fxCol.rgb = mix(fxCol.rgb*depthO, fxCol.rgb, inFXInfo[1].x);
	
	fxCol.a = mix(fxCol.a, fxCol.a*depthO, inFXInfo[1].x);
#endif
	
	finalCol0 = fxCol;
}
