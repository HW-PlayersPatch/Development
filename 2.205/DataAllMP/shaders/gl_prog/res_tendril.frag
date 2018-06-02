#ifdef FX_SCISSOR
smooth in float outScissor;
#endif

smooth in vec4 outAnim;
smooth in vec4 outCol0;
smooth in vec4 outCol1;
smooth in vec2 outUV0;
smooth in vec3 outNorm_W;
smooth in vec3 outPos_W;
smooth in vec3 outEye_W;

uniform sampler2D inTexFx;

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
	float depthF = linearize(gl_FragCoord.z);
	
	float distFade = clamp((depthF-5000.0)/40000.0, 0.0, 1.0);
	distFade = pow(distFade, 0.75)*(1.0f-inZoomSM);		// Maybe pow later?
	
	vec3 normW = normalize(outNorm_W);
	vec3 eyeW = normalize(-outEye_W);
	
	float rawFren = abs(dot(normW, eyeW));
	float extFren = min(1.0, pow((1.0-rawFren)*1.05, 2.25))*(0.65-(distFade*0.3));
	float inFren = pow(rawFren*0.9, 4.0-(distFade*2.5))*(0.35+(distFade*0.15));
	
	vec4 fxCol = vec4(0.0);
	fxCol.a = outCol0.a;
	
	fxCol.a = max(fxCol.a-distFade, 0.0);

	vec3 baseCol = vec3(extFren+inFren)*outCol1.rgb;
	
	fxCol.rgb += baseCol*inLightCore[0].rgb;
	
	vec3 litNorm = normalize(inLightCore[1].rgb);
	float litDif = clamp(dot(litNorm, normW), 0.0, 1.0);
	vec3 litRefl = reflect(-litNorm, normW);
	float litSpec = clamp(dot(-eyeW, litRefl), 0.0, 1.0);
	litSpec = pow(litSpec, 1.5)*min(litDif*1000, 1.0);
	
	fxCol.rgb += baseCol*(inLightCore[2].rgb*litDif);
	fxCol.rgb += baseCol*(inLightCore[3].rgb*litSpec);
	
	litNorm = normalize(inLightCore[4].rgb);
	litDif = clamp(dot(litNorm, normW), 0.0, 1.0);
	fxCol.rgb += baseCol*(inLightCore[5].rgb*litDif);
	
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

	fxCol.rgb += vec3(inTest.x);
	fxCol.a += inTest.y;
	
	finalCol0 = fxCol;
}
