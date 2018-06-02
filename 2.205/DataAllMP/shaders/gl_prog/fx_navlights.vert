#version 330

layout (location = 0) in vec4 inPos;
layout (location = 4) in vec4 inCol0;
layout (location = 6) in vec2 inUV0;
layout (location = 10) in vec4 inCen;

uniform mat4 inMatP;
uniform vec4 inWindow;

smooth out vec2 outUV0;
smooth out vec4 outCol0;

void main()
{
	vec4 screenCen = inMatP*inCen;
	screenCen /= screenCen.w;
	vec4 screenCorner = inMatP*inPos;
	screenCorner /= screenCorner.w;
	
	vec3 toCen = screenCorner.xyz-screenCen.xyz;
	toCen.x *= inWindow.x;
	toCen.y *= inWindow.y;
	toCen.z = 0.0;
	
	float lenCen = length(toCen);
	float useLen = max(5.0, lenCen);
	float brightRatio = max(0.25, pow(lenCen/useLen, 0.15));
	toCen = normalize(toCen);
	
	screenCorner.x = (toCen.x*useLen*inWindow.z)+screenCen.x;
	screenCorner.y = (toCen.y*useLen*inWindow.w)+screenCen.y;
	screenCorner.z = screenCen.z;
	
	gl_Position = screenCorner;
	outUV0 = inUV0;
	outCol0 = inCol0;
	outCol0.a *= brightRatio*2.0;
}
