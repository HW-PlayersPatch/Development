smooth in vec4 outCol0;
smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexTrail;

layout (location = 0) out vec4 finalCol0;

uniform vec4 inDepth;
float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = (2.0*depth)-1.0;    
	float ret = (2.0*znear*zfar) / (zfar+znear-(z_n*(zfar-znear)));
	return ret;
}

void main()
{
	vec4 trailTex = texture(inTexTrail, outUV0);
	trailTex.rgb *= 2.0;
	vec4 trailCol = trailTex*outCol0;
	
	float depthF = linearize(gl_FragCoord.z);
	float nearFade = min(1.0, (depthF-znear)/25.0f);
	
	float depthO = nearFade;

	trailCol.rgb = mix(trailCol.rgb*depthO, trailCol.rgb, outUV1.x);
	trailCol.a = mix(trailCol.a, trailCol.a*depthO, outUV1.x);
	
	finalCol0 = trailCol;
}
