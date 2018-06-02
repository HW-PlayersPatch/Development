#version 330

smooth in vec4 outCol0;

layout (location = 0) out vec4 finalCol0;

float hex(vec2 p)
{
	p.x *= 0.57735*2.0;
	p.y += mod(floor(p.x), 2.0)*0.5;
	p = abs((mod(p, 1.0) - 0.5));
	return abs(max(p.x*1.5 + p.y, p.y*2.0) - 1.0);
}
 
void main(void) { 
	vec2 pos = gl_FragCoord.xy;
	vec2 p = pos/50.0; 
	float  r = (1.0 -0.7)*0.5;	
	finalCol0 = vec4(smoothstep(0.0, r + 0.05, hex(p)))*outCol0;
	
	//finalCol0 = outCol0;
}
