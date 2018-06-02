#ifdef FX_SCISSOR
smooth in float outScissor;
#endif

smooth in vec4 outCol1;
smooth in vec2 outUV0;
smooth in vec2 outUV1;
smooth in vec2 outUV2;
smooth in vec3 outNorm_W;
smooth in vec3 outEye_W;

uniform sampler2D inTexFx;
uniform sampler2D inTexNoise;

uniform vec4 inFXInfo[2];
uniform vec4 inLightCore[7];

uniform float inZoomSM;
uniform vec2 inTest;

layout (location = 0) out vec4 finalCol0;

#ifdef DEPTH_BIAS
uniform sampler2D inTexDepth;
uniform vec4 inWindow;
#endif

uniform vec4 inDepth;

float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));
	return ret;
}

void main()
{
	vec3 normW = normalize(outNorm_W);
	vec3 eyeW = normalize(-outEye_W);
	float rawFren = abs(dot(normW, eyeW));
	
	float zoomA = 1.5+(inZoomSM*-0.5);
	float zoomC = 1.0+(inZoomSM*0.5);
	
	float loT = pow(texture(inTexFx, outUV0).a, 0.4)*zoomA;
	float hiT1 = texture(inTexNoise, outUV1).a;
	float hiT2 = texture(inTexNoise, outUV2).a;
	float hiT = max(hiT1, hiT2);
	float depthF = linearize(gl_FragCoord.z);
	
	float hardFade = clamp((depthF-250.0)/4000.0, 0.0, 1.0);	// Fade near camera...
	float hiFade = clamp(1.5-(depthF/15000.0), 0.0, 1.0);		// 1.0 near, 0.0 far
	float farFade = clamp((depthF-9000.0)/12000.0, 0.0, 1.0);	// 0.0 near, 1.0 far
	
	float hiCurve = mix(1.0, hiT, hiFade);
	loT = pow(loT*2.0, 2.0)/3.0;
	float texT = loT*hiCurve;
	
	float nearFren = clamp(1.0-(abs(0.8-pow(rawFren, 1.5))*4.0), 0.0, 1.0);
	float farFren = pow(rawFren, 1.2);
	float useFren = mix(nearFren, farFren, farFade);
	useFren = pow(min(1.0, useFren*1.5), 0.5);
	
	float baseC = 0.1*zoomC;
	float denseA = outCol1.a*loT*farFren;
	float baseA = outCol1.a*texT*useFren;
	
	baseA = mix(baseA*1.2, baseA*0.6, farFade);
	baseC = mix(1.1, baseC, min(1.0, denseA*1.8));
	hardFade = pow(hardFade, 0.4);
	vec4 fxCol = vec4(baseC, baseC, baseC, baseA*hardFade);
	fxCol.rgb *= inLightCore[2].rgb;
	
#ifdef DEPTH_BIAS
	float biasWindow = 20.0;
	vec2 uvD = gl_FragCoord.xy*inWindow.zw;
	float depthB = linearize(texture(inTexDepth, uvD).x);
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
