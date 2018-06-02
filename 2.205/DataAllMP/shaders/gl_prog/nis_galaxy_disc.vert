layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

uniform vec4 inTime;
uniform vec4 inTrigger;
uniform float inTimeScale;
uniform vec4 inMatScale;
uniform float inTimeDelay;

smooth out vec2 outUV0;

void main()
{
	outUV0 = inUV0;	
	
	vec4 usePos = vec4(inPos, 1.0);
	vec3 posDist = vec3(inPos.x, 0.0, inPos.z);
	float distDeg = clamp(length(posDist)/1500.0, 0.0, 1.0);
	float distDegSq = pow(distDeg, 2.0);
	
	float nowTime = inTimeScale*((inTime.z-inTrigger.z)-inTimeDelay);
	
	float timeOfsXZ = 0.0;
	float timeDivXZ = 0.5+(distDegSq*4.5);
	float scaleTimeXZ = clamp((nowTime-timeOfsXZ)/timeDivXZ, 0.0, 1.0);
	float scaleDegXZ = (pow(scaleTimeXZ, 0.25)*0.75)+0.25;
	
	float timeOfsY = 2.5+(distDeg*2.5);
	float timeDivY = 2.5+(distDeg*5.0);
	float scaleTimeY = clamp((nowTime-timeOfsY)/timeDivY, 0.0, 1.0);
	float scaleDegY = (pow(scaleTimeY, 3.0)*0.8)+0.2;
	
	usePos.xyz *= vec3(scaleDegXZ, scaleDegY*inMatScale.y, scaleDegXZ);
	
	gl_Position = inMatP*inMatV*inMatM*usePos;	
}
