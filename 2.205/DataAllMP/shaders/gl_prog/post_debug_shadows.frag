#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2DShadow inTexShadow;

uniform vec4 inWindow;
uniform vec4 inTime;
uniform vec4 inMouse;

layout (location = 0) out vec4 finalCol0;

void main()
{
	int i;
	
	float shadowZ = 0.0;
	float depth = 0.0;
	for (i=0; i<10; i++)
	{
		vec3 uvz = vec3(outUV0.x, outUV0.y, depth);
		shadowZ += texture(inTexShadow, uvz)*0.1;
		depth += 0.1;
	}
	
	finalCol0 = vec4(1.0, 1.0, 1.0, 1.0-shadowZ);
}
