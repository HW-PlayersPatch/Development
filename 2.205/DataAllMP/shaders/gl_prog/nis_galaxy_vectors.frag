smooth in vec2 outUV0;
smooth in float outDist;
smooth in float outArc;
flat in int outIndex;

uniform vec4 inTime;
uniform vec4 inTrigger;
uniform float inTimeScale;

uniform sampler2D inTexDiff;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 texDiff = texture(inTexDiff, outUV0);
	vec4 texOut = texDiff;
	
	float nowTime = inTimeScale*(inTime.z-inTrigger.z);
	
	bool reject = false;
	
	switch (outIndex)
	{
	case 0:{	// Broken Circles
		float ofsDeg = clamp((nowTime-15.0)/1.0, 0.0, 1.0);
		if (ofsDeg < outDist)
		{
			reject = true;
		}
	} break;
	case 1:{	// Capitals
		float ofsDeg = clamp((nowTime-10.0)/2.0, 0.0, 1.0);
		if (ofsDeg < outDist)
		{
			reject = true;
		}
	} break;
	case 2:{	// Routes
		float ofsDeg = clamp((nowTime-12.0)/3.0, 0.0, 1.0);
		ofsDeg = pow(ofsDeg, 0.65);
		if (ofsDeg < outDist)
		{
			reject = true;
		}
	} break;
	case 3:{	// Solid Circles
		float ofsDeg = clamp((nowTime-14.0)/2.0, 0.0, 1.0);
		if (ofsDeg < outDist)
		{
			reject = true;
		}
	} break;
	case 6:{	// Hashtrails
		float ofsDeg = clamp((nowTime-15.0)/3.0, 0.0, 1.0);
		ofsDeg = pow(ofsDeg, 0.65);
		if (ofsDeg < outArc)
		{
			reject = true;
		}
	} break;
	}
	
	if (true == reject)
	{
		discard;
	}
	
	finalCol0 = texOut;
}
