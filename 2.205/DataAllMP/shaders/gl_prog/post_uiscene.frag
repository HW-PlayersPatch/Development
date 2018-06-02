smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexUI;
uniform sampler2D inTexScene;
uniform sampler2D inTexGlow;
uniform sampler2D inTexBlur;

uniform vec4 inWindow;
uniform vec4 inTime;
uniform vec4 inMouse;

layout (location = 0) out vec4 finalCol0;

void main()
{
	float scanLine = (fract(inTime.x*0.15)*1.2)-0.1;	// Make top/bottom flow cleaner, add 'no scan' period
	float scanNoise = fract(inTime.x*900.0);
	float scanNoiseB = fract(inTime.x*1093.7);
	float scanBar = (scanNoise*6.0)+12.0;
	float scanPower = max(1.0-(abs(scanLine-outUV0.y)*scanBar), 0.0);
	
	vec4 texUI = texture(inTexUI, outUV0);
	texUI.a = 1.0-texUI.a;						// Accumulated inversely...
	texUI.rgb = texUI.rgb/(texUI.a+0.00001);	// Extra bit to prevent div by 0
	// texUI is now the UI color _with_ viable alpha corrected for accumlation.
	
	float pixelBarSize = 300.0/1080.0;
	float pixelBarX = inWindow.x*pixelBarSize;
	float pixelBarY = inWindow.y*pixelBarSize;
	
	float pixelDark = min(abs(0.5-fract(outUV0.y*pixelBarY))*5.0, 1.0);
	pixelDark = 1.0-pow(pixelDark, 0.3);
	
	float pixelScan = 1.0+(scanPower*5.0);
	float pixelFactor = (1.0-pow(texUI.a, 6.0))*pixelDark;
	
#ifdef UI_ENHANCED
	vec2 ofsR = vec2((3.0+(scanPower*5.0))*inWindow.z, 0.0);
	vec2 ofsG = vec2((scanPower*-0.5)*inWindow.z, (2.0+(scanPower*0.5))*inWindow.w);
	vec2 ofsB = vec2(-1.0*inWindow.z, (-3.0-scanNoiseB)*inWindow.w);
#else
	vec2 ofsR = vec2(0.0, 0.0);
#endif
	
	float rgbDown = pixelFactor*pixelScan*0.35;
	float alphaDown = pixelFactor*0.2;
	texUI.rgb = max(texUI.rgb-rgbDown, 0.0);
	texUI.a = max(texUI.a-alphaDown, 0.0);
		
	vec4 texScene = texture(inTexScene, outUV0);
	
	float stepX = inWindow.z;
	float stepXH = stepX*0.5;
	
	float stepY = inWindow.w;
	float stepYH = stepY*0.5;
	
	vec4 texBlur = texture(inTexBlur, outUV0+(ofsR*1.5f));
	float sceneFocus = pow(texUI.a, 0.25);
	texScene = mix(texScene, texBlur, sceneFocus);
	vec4 sceneWithUI = mix(texScene, texUI, texUI.a);
	
	// Increase contrast of UI over scene...
	float diffLum = max(1.0-(length(texScene.rgb-sceneWithUI.rgb)*4.0), 0.0)*texUI.a;
	diffLum = 1.0-pow(diffLum, 2.5);
	texScene.rgb *= diffLum;
	sceneWithUI = mix(texScene, texUI, texUI.a);
	
#ifdef UI_ENHANCED
	vec4 texGlowR = texture(inTexGlow, outUV0+ofsR);
	vec4 texGlowG = texture(inTexGlow, outUV0+ofsG);
	vec4 texGlowB = texture(inTexGlow, outUV0+ofsB);
	
	float glowPowerR = 0.65+(scanPower*0.15);
	float glowPower = 0.6+(scanPower*0.1)+((scanNoise-scanNoiseB)*0.025);

	sceneWithUI.r += texGlowR.r*(texGlowR.a*glowPowerR);
	sceneWithUI.g += texGlowG.g*(texGlowG.a*glowPower);
	sceneWithUI.b += texGlowB.b*(texGlowB.a*glowPower);
#endif
	
	float glowBoost = scanPower*scanPower*texUI.a*0.33;
	float glowMul = 1.0+glowBoost;
	
	sceneWithUI.rgb *= glowMul;
	finalCol0 = sceneWithUI;
}
