smooth in vec2 outUV0;
smooth in vec3 outNorm_W;
smooth in vec3 outPos_W;

uniform vec4 inTime;
uniform vec4 inGammaScale;
uniform sampler2D inTexDiff;
uniform vec4 inLightCore[7];

uniform vec4 inColDiff;
uniform vec4 inColEmis;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec4 texDiff = texture(inTexDiff, outUV0);
	
	vec3 worldNorm = normalize(outNorm_W);
		
	// Seed lighting with Ambient+Black
	vec3 diffAt = inLightCore[0].rgb;
	
	// Key Light
	vec3 litNorm = normalize(inLightCore[1].rgb);
	diffAt += inLightCore[2].rgb*clamp(dot(litNorm, worldNorm), 0.0, 1.0);
	
	// Fill Light
	litNorm = normalize(inLightCore[4].rgb);
	diffAt += inLightCore[5].rgb*clamp(dot(litNorm, worldNorm), 0.0, 1.0);
	
	// 'Average' Light - the diffused result of lit dust...
	vec3 diffMid = inLightCore[0].rgb;
	diffMid += (inLightCore[2].rgb+inLightCore[5].rgb)*0.5;
	
	vec3 diffMix = mix(diffMid, diffAt, texDiff.a);
	
	vec3 paint = texDiff.rgb*diffMix;
	paint = pow(paint, vec3(inGammaScale))*inGammaScale.a;
	
	vec4 dustC = vec4(paint, texDiff.a)*inColDiff;
	dustC.r *= 1.0+(inColEmis.r*inColEmis.a*5.0);
	dustC.g *= 1.0+(inColEmis.g*inColEmis.a*5.0);
	dustC.b *= 1.0+(inColEmis.b*inColEmis.a*5.0);
		
	finalCol0 = dustC;
}
