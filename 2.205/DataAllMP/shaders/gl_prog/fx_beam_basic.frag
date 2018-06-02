smooth in vec4 outCol0;
smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexBeam;

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

#ifdef DEPTH_BIAS
smooth in float outOfs;
uniform sampler2D inTexDepth;
uniform vec4 inWindow;
#endif

void main()
{
	vec4 beamTex = texture(inTexBeam, outUV0);
	beamTex.rgb *= 2.0;
	vec4 beamCol = beamTex*outCol0;
	
	float depthF = linearize(gl_FragCoord.z);
	float nearFade = min(1.0, (depthF-znear)/25.0f);
	
#ifdef DEPTH_BIAS
	float beamLumiC = dot(beamTex.rgb, vec3(0.4, 0.4, 0.4));
	float beamLumi = pow(min(mix(beamLumiC, beamTex.a, outUV1.x), 1.0), 0.5);
	float beamSlice = beamLumi*outOfs*0.5;
	
	vec2 uvD = gl_FragCoord.xy*inWindow.zw;
	float depthB = linearize(texture(inTexDepth, uvD).x);
	float diffZ = min(depthB-depthF, beamSlice);
	
	float depthO = clamp(diffZ/beamSlice, 1.0-outUV1.y, 1.0)*nearFade;
#else
	float depthO = nearFade;
#endif

	beamCol.rgb = mix(beamCol.rgb*depthO, beamCol.rgb, outUV1.x);
	beamCol.a = mix(beamCol.a, beamCol.a*depthO, outUV1.x);
	
	finalCol0 = beamCol;
}
