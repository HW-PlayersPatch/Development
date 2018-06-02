#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexColor;
uniform sampler2D inTexBase;

uniform vec4 inRes;

uniform vec3 inLumiMap;
uniform vec3 inLumiIn;
uniform vec4 inLumiOut;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	vec3 configLumi = inLumiMap;
	float configInThresh = inLumiIn.x;
	float configInBoost = inLumiIn.y;
	float configInCurve = inLumiIn.z;
	float configOutMask = inLumiOut.x;
	float configOutCurve = inLumiOut.y;
	float configOutScale = inLumiOut.z;
	float configOutDesat = inLumiOut.w;

	vec3 baseTex = texture(inTexBase, outUV0).rgb;
	
	vec2 uvBlur = outUV0;
	
	/*
	// Nearest Point sample...
	float dimW = inRes.x;
	float dimH = inRes.y;
	uvBlur.x = floor(outUV0.x*dimW)/dimW;
	uvBlur.y = floor(outUV0.y*dimH)/dimH;
	uvBlur.x += 0.5/dimW;
	uvBlur.y += 0.5/dimH;
	*/
	
	vec3 accumC = texture(inTexColor, uvBlur).rgb;
	accumC = max(pow(accumC, vec3(configOutCurve))*configOutScale, 0.0);
	float desatC = (accumC.r*0.3333)+(accumC.g*0.3333)+(accumC.b*0.3333);
	accumC = mix(accumC, vec3(desatC), configOutDesat);
	
	float lumiRaw = dot(baseTex, configLumi);
	float lumiThresh = pow(clamp((lumiRaw-configInThresh)/(1.0-configInThresh)*configInBoost, 0.0, 1.0), configInCurve);
	vec3 maskTex = 1.0-(baseTex*lumiThresh*configOutMask);
	
	finalCol0.rgb = baseTex+(accumC*maskTex);
		
	//finalCol0.rgb = baseTex;
	//finalCol0.rgb = accumC;
	//finalCol0.rgb = accumC*maskTex;
	//finalCol0.rgb = maskTex;
	//finalCol0.rgb = (baseTex*0.25)+accumC;
	
	finalCol0.a = 1.0;
}
