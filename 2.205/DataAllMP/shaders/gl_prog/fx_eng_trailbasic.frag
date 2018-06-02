smooth in vec2 outUV0;
smooth in vec2 outUV1;
smooth in float outFade;

uniform vec4 inDepth;

uniform sampler2D inTexTeam;
uniform sampler2D inTexShape;

layout (location = 0) out vec4 finalCol0;


float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));
	return ret;
}

void main()
{
	float depthF = linearize(gl_FragCoord.z)-znear;
	depthF = min(1.0, depthF/25.0f);
	
	vec4 teamTex = texture(inTexTeam, outUV0);
	vec4 shapeTex = texture(inTexShape, outUV1);
	
	vec4 trailCol = teamTex*shapeTex*1.5;
	trailCol.a *= outFade*depthF;
	
	/*
	trailCol = vec4(0);
	if (outUV0.y < 0.1) trailCol.r = 1.0;
	if (outUV0.y > 0.9) trailCol.g = 1.0;
	trailCol.b = clamp(outFade*0.25, 0.0, 0.25);
	trailCol.a = depthF*1.0;
	*/
	
	finalCol0 = trailCol;
	//finalCol0 = vec4(1.0, 1.0, 1.0, 0.25);
}
