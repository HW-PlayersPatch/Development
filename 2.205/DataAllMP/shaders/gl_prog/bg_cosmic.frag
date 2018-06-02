smooth in vec4 outCol0;
smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexMatter;
uniform sampler2D inTexMask;
uniform sampler2D inTexWarp;

uniform vec4 inFade;
uniform vec4 inAddLight;
uniform vec4 inTime;
uniform vec3 inBlends;

uniform vec4 inMoveMatter;
uniform vec4 inMoveMask;

#ifdef USE_NORMS
smooth in vec3 outNorm;
smooth in vec3 outTan;
smooth in vec3 outBiNorm;
uniform sampler2D inTexNorm;
uniform mat4 inMatMV;
uniform vec4 inLightCore[7];
#endif

layout (location = 0) out vec4 finalCol0;

void main()
{
	// Warping layer
	vec4 texWarp = texture(inTexWarp, outUV1);
	
	// Texture & Mask
	vec2 ofsMatter = vec2(fract(inTime.z*inMoveMatter.x), fract(inTime.z*inMoveMatter.y));
	ofsMatter += (texWarp.xy-0.5)*inMoveMatter.zw;
	vec4 texBase = texture(inTexMatter, outUV0+ofsMatter);
	
#ifndef FX_ALPHA
	texBase.a = 1.0;
#endif
	
	vec2 ofsMask = vec2(fract(inTime.z*inMoveMask.x), fract(inTime.z*inMoveMask.y));
	ofsMask += (texWarp.xy-0.5)*inMoveMask.zw;
	vec4 texMask = texture(inTexMask, outUV0+ofsMask);
	
	vec4 colorMul = texBase*outCol0;
	vec4 colorHL = mix(texBase*clamp(outCol0*2.0, 0.0, 1.0), vec4(1.0), clamp((outCol0*2.0)-1.0, 0.0, 1.0));
	vec4 useColor  = mix(colorMul, colorHL, inBlends.z)*texMask;
	
#ifdef USE_NORMS
	vec3 texNorm = normalize(texture(inTexNorm, outUV0).rgb*2.0-1.0);
	vec3 tempTW = mat3(outTan, outBiNorm, outNorm)*texNorm;
	vec3 worldNorm = normalize(mat3(inMatMV)*tempTW);
	
	// Seed lighting with Ambient+Black
	vec3 diffAll = inLightCore[0].rgb;
	
	// Key Light
	vec3 litNorm = normalize(inLightCore[1].rgb);
	float litDif = clamp(dot(litNorm, worldNorm), 0.0, 1.0);
	diffAll += inLightCore[2].rgb*litDif;
	
	// Fill Light
	litNorm = normalize(inLightCore[4].rgb);
	litDif = clamp(dot(litNorm, worldNorm), 0.0, 1.0);
	diffAll += inLightCore[5].rgb*litDif;
	
	useColor.rgb *= mix(diffAll, vec3(1.0), min(1.0, pow(useColor.a, 0.6)));
#endif
	
#ifdef FX_ALPHA
	useColor = (useColor+vec4(inAddLight.rgb, 0.0))*inFade*getBackExp();
#else
	useColor = useColor*inFade*getBackExp();
#endif
	
	finalCol0 = useColor;
}
