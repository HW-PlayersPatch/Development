#version 330

smooth in vec3 outFade;
smooth in vec3 outNorm_W;
smooth in vec3 outEye_W;

uniform vec4 inColGlow;

layout (location = 0) out vec4 finalCol0;

void main()
{
	float coneA = 1.0-min(abs(outFade.z/30.0), 1.0);	// A value faded from nozzle out a bit.
	float sphereA = pow(clamp(dot(outNorm_W, normalize(outEye_W))*-1.0, 0.0, 1.0), 1.5);
	float blendA = max((coneA*0.5)+sphereA, 0.0)*1.3;

	vec4 useGlow = inColGlow;
	useGlow.a *= blendA;
	
	finalCol0 = useGlow;
}
