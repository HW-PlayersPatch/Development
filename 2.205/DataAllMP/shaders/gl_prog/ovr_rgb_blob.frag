smooth in vec4 outPosW;

uniform vec4 inTint;
uniform vec4 inTime;
uniform vec4 inWindow;

layout (location = 0) out vec4 finalCol0;

void main()
{
	float mulTint = 1.0;

	if (outPosW.y >= 0.0f)
	{
		float timePulse = abs(1.0-(fract((inTime.x-(outPosW.y/5000.0))/2.0)*2.0));
		timePulse = 1.0-(timePulse*timePulse);
		mulTint = 0.925+(timePulse*0.075);
	}
	else
	{
		float timePulse = abs(1.0-(fract((inTime.x+(outPosW.y/5000.0))/2.0)*2.0));
		timePulse = 1.0-(timePulse*timePulse);
		mulTint = 0.8+(timePulse*0.075);
	}
	
	vec4 finalOut = inTint*vec4(mulTint, mulTint, mulTint, 0.5);
	
#ifdef BLOB_UIFX
	float windowY = gl_FragCoord.y*inWindow.w;

	float scanLine = (fract(inTime.x*0.15)*1.2)-0.1;	// Make top/bottom flow cleaner, add 'no scan' period
	float scanNoise = fract(inTime.x*900.0);
	float scanNoiseB = fract(inTime.x*1093.7);
	float scanBar = (scanNoise*6.0)+12.0;
	float scanPower = max(1.0-(abs(scanLine-windowY)*scanBar), 0.0);
	
	float pixelBarSize = 300.0/1080.0;
	float pixelBarY = inWindow.y*pixelBarSize;
	
	float pixelDark = min(abs(0.5-fract(windowY*pixelBarY))*5.0, 1.0);
	pixelDark = 1.0-pow(pixelDark, 0.3);
	
	float pixelScan = 1.0+(scanPower*5.0);
	float pixelFactor = (1.0-pow(finalOut.a, 6.0))*pixelDark;
	
	float rgbDown = pixelFactor*pixelScan*0.2;
	float alphaDown = pixelFactor*0.1;
	finalOut.rgb = max(finalOut.rgb-rgbDown, 0.0);
	finalOut.a = max(finalOut.a-alphaDown, 0.0);
	
	float glowBoost = scanPower*scanPower*finalOut.a*2.0;
	float glowMul = 1.0+glowBoost;
	
	finalOut.rgb *= glowMul;
#endif

	finalCol0 = finalOut;
}
