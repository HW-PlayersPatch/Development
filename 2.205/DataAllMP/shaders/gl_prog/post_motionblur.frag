#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;
smooth in mat4 outLCMat;
smooth in mat4 outInvC;

uniform vec4 inTime;
uniform vec4 inWindow;

uniform vec4 inMotionInfo;

uniform sampler2D inTexColor;
uniform sampler2D inTexDepth;
uniform sampler2D inTexPrevD;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	float texD = min(texture(inTexDepth,outUV0).x, 0.9999);
	float texP = min(texture(inTexPrevD,outUV0).x, 0.9999);
	float depthDelt = min(abs(texD-texP)*100000.0, 1.0);
	
	vec4 scrPos = vec4((outUV0.x*2.0)-1.0, (outUV0.y*2.0)-1.0, texD, 1.0);
	
	vec4 worldPos = outInvC*scrPos;
	vec4 pastPos = outLCMat*worldPos;
	//pastPos.w = 1.0/pastPos.w;
	pastPos.x = ((pastPos.x/pastPos.w)+1.0)/2.0;
	pastPos.y = ((pastPos.y/pastPos.w)+1.0)/2.0;
	
	vec2 startPos = vec2(outUV0.x*inWindow.x, outUV0.y*inWindow.y);
	vec2 rootPos = startPos;
	vec2 endPos = vec2(pastPos.x*inWindow.x, pastPos.y*inWindow.y);
	vec2 deltPos = (endPos-startPos)*inMotionInfo.w;
	
	float pixelCalib = inWindow.y/768.0;	// Values calibrated against specific screen res... 
	
	float deltVel = length(deltPos)/inTime.y;	// Delta as constant per-second
	vec2 deltVec = normalize(deltPos)*2.33*pixelCalib;	// Walk quicker!
	
	float limitStep = 24.0;
	float maxStep = mix(depthDelt, 8.0, limitStep);
	
	float farStep = pow(clamp((deltVel-0.1)/(4.0*pixelCalib)*inWindow.w, 0.0, 1.0), 3.5);
	
	float totalStep = min(farStep*limitStep, maxStep);
	
	vec3 firstC = texture(inTexColor,outUV0).rgb;
	
	vec2 uvMin = vec2(1.0, 1.0);
	vec2 uvMax = vec2(inWindow.x-1.0, inWindow.y-1.0);
	
	float accumW = 1.0;
	vec3 accumC = firstC*accumW;
	
	float curStep = totalStep;
	while (curStep > 1.0)
	{
		curStep -= 1.0;
		startPos = clamp(startPos+deltVec, uvMin, uvMax);
		vec2 mirrorPos = clamp(rootPos+((rootPos-startPos)*0.5f), uvMin, uvMax);
		
		vec2 uvPos = vec2(startPos.x*inWindow.z, startPos.y*inWindow.w);
		vec3 color0 = texture(inTexColor,uvPos).rgb;
		
		uvPos = vec2(mirrorPos.x*inWindow.z, mirrorPos.y*inWindow.w);
		vec3 color1 = texture(inTexColor,uvPos).rgb;
		
		float useW = pow(curStep/totalStep, 1.4);
		accumC += (color0+color1)*0.5*useW;
		accumW += useW;
	}
	
	vec3 finalC = accumC/accumW;
	
	finalCol0.rgb = finalC;
	//finalCol0.rgb = (finalC-firstC)*5.0+0.5;
	finalCol0.a = 1.0;
	
	// Visualize motion vectors...
	//finalCol0.rgb = vec3(deltPos.x+0.5, deltPos.y+0.5, 0.0);
	
	// Visualize motion strength...
	//finalCol0.rgb = vec3(totalStep/limitStep);
}