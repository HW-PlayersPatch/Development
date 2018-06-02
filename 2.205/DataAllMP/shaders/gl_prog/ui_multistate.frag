smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTex0;
uniform sampler2D inTex1;

uniform vec4 inTint;
uniform vec3 state0;
uniform vec3 state1;
uniform vec3 state2;
uniform vec3 decal;

#ifdef TINT_LAYERS
uniform vec4 tint_0;
uniform vec4 tint_1;
uniform vec4 tint_2;
uniform vec4 tint_d;
#endif

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec2 layerUV0 = outUV0+vec2(state0.x, state0.y);
	vec2 layerUV1 = outUV0+vec2(state1.x, state1.y);
	vec2 layerUV2 = outUV0+vec2(state2.x, state2.y);
	vec2 decalUV = outUV0+vec2(decal.x, decal.y);
	
	vec4 texel0 = texture(inTex0, layerUV0);
	vec4 texel1 = texture(inTex0, layerUV1);
	vec4 texel2 = texture(inTex0, layerUV2);
	vec4 texelD = texture(inTex0, decalUV);
	texelD.a *= decal.z;
	
#ifdef TINT_LAYERS
	const float scale255 = 1.0/255.0;
	
	texel0 = texel0*scale255*tint_0;
	texel1 = texel1*scale255*tint_1;
	texel2 = texel2*scale255*tint_2;
	texelD = texelD*scale255*tint_d;
	
	//texel0.rgb = mix(texel0.rgb, texel0.rgb*tint_0.rgb*scale255, tint_0.a*scale255);
	//texel1.rgb = mix(texel1.rgb, texel1.rgb*tint_1.rgb*scale255, tint_1.a*scale255);
	//texel2.rgb = mix(texel2.rgb, texel2.rgb*tint_2.rgb*scale255, tint_2.a*scale255);
	//texelD.rgb = mix(texelD.rgb, texelD.rgb*tint_d.rgb*scale255, tint_d.a*scale255);
#endif
	
	texel0 = mix(texel0, texel1, state1.z);
	texel0 = mix(texel0, texel2, state2.z);
	
	vec3 texelOut = mix(vec3(texel0.r, texel0.g, texel0.b), vec3(texelD.r, texelD.g, texelD.b), texelD.a);
	float texelA = mix(texel0.a, 1.0, texelD.a);
	
	vec4 texelF = texture(inTex1, outUV1);
	//finalCol0 = vec4(outUV1.x, outUV1.y, texelF.b, texelF.a);
	finalCol0 = vec4(texelOut.r, texelOut.g, texelOut.b, texelA)*inTint*texelF;
}
