layout (location = 0) in vec4 inPos;
layout (location = 1) in vec4 inNorm;
layout (location = 4) in vec4 inCol0;

uniform mat4 inMatV;
uniform mat4 inMatP;
uniform vec4 inCamera;

smooth out vec2 outUV0;
smooth out vec2 outUV1;
smooth out float outFade;

void main()
{
	mat4 VP = inMatP*inMatV;
	vec3 camEye = inCamera.xyz;//vec3(-225.77051, 1141.92236, 1788.93115);//
	
	vec3 center = inPos.xyz;
	float radius = inPos.w;
	float slideU = inNorm.w;
	
	float age = inCol0.x;
	float fade = inCol0.y;
	float bump = inCol0.z;
	
	float edge = 1.0;
	if (bump < 0.0)
	{
		bump += 1.0;
		edge = 0.0;
	}
	
	float axisDir = (edge*2.0)-1.0;
	vec3 camDir = normalize(center-camEye);
	vec3 segDir = normalize(inNorm.xyz);
	vec3 axis = normalize(cross(camDir, segDir));
	
	// Fade edge-on to reduce 'fold over' double-bright glitches...
	float facingFade = clamp((abs(dot(camDir, segDir))-0.8)*5.25, 0.0, 1.0);
	fade *= 1.0-pow(facingFade, 1.5);
	
	vec3 usePos = center+(axisDir*radius*axis);
	
	gl_Position = VP*vec4(usePos, 1);
	
	outUV0 = vec2(clamp(age, 0.0, 1.0), edge);
	outUV1 = vec2(slideU, bump);
	outFade = fade;
}