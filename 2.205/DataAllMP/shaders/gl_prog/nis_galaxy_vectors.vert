layout (location = 0) in vec3 inPos;
layout (location = 1) in vec3 inNorm;
layout (location = 6) in vec2 inUV0;

uniform mat4 inMatM;
uniform mat4 inMatV;
uniform mat4 inMatP;

uniform vec4 inTime;
uniform vec4 inTrigger;
uniform float inTimeScale;

smooth out vec2 outUV0;
smooth out float outDist;
smooth out float outArc;
flat out int outIndex;

void main()
{
	outUV0 = inUV0;
	
	vec3 posRot = mat3(inMatM)*inPos;
	vec3 posDist = vec3(posRot.x, 0.0, posRot.z);
	outDist = clamp(length(posDist)/1500.0, 0.0, 1.0);
		
	float rotDist = outDist;
	float rotX = (posRot.x*cos(rotDist))-(posRot.z*sin(rotDist));
	float rotZ = (posRot.x*sin(rotDist))+(posRot.z*cos(rotDist));
	outArc = fract(((atan(rotZ, rotX)*-1.0)+(3.14159*2.0)-2.1)/3.14159);
	
	float nowTime = inTimeScale*(inTime.z-inTrigger.z);
	
	int gridX = int(floor(inUV0.x*2.0));
	int gridY = int(floor((1.0-inUV0.y)*4.0));
	outIndex = (gridY*2)+gridX;
	
	float ofsZ = 0.0;
	
	switch (outIndex)
	{
	case 0:{	// Broken Circles
		float ofsDeg = clamp((nowTime-15.0)/1.0, 0.0, 1.0);
		ofsZ = (1.0-ofsDeg)*-500.0;
	} break;
	case 1:{	// Capitals
		float ofsDeg = clamp((nowTime-10.0)/2.0, 0.0, 1.0);
		ofsZ = (1.0-ofsDeg)*500.0;
	} break;
	case 3:{	// Solid Circles
		float ofsDeg = clamp((nowTime-14.0)/2.0, 0.0, 1.0);
		ofsZ = (1.0-ofsDeg)*500.0;
	} break;
	}
	
	vec4 usePos = vec4(inPos, 1.0);
	usePos.z -= ofsZ;
	gl_Position = inMatP*inMatV*inMatM*usePos;	
}
