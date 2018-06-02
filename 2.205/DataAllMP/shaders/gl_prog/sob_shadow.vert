layout (location = 0) in vec3 inPos;

#ifdef SOB_SCISSOR
layout (location = 6) in vec2 inUV0;
smooth out vec2 outUV0;
#endif

uniform mat4 inMatM;

#ifdef SOB_SHADOWS_ON
uniform mat4 inMatKL;
uniform vec4 inShadowTrans[4];
#endif

#ifdef SOB_SHADOWS_DUAL
uniform mat4 inMatFL;
#endif

void main()
{
	#ifdef SOB_SCISSOR
		outUV0 = inUV0;
	#endif

	vec4 posW4 = inMatM*vec4(inPos, 1.0f);
	
	#ifdef SOB_SHADOWS_ON
		#ifdef SOB_SHADOWS_DUAL
			vec3 posKL = (inMatKL*posW4).xyz;
			vec3 posFL = (inMatFL*posW4).xyz;
			vec3 posL = mix(posKL, posFL, inShadowTrans[0].w);
		#else
			vec3 posL = (inMatKL*posW4).xyz;
		#endif
	
		vec3 shadowZ = (posL*inShadowTrans[1].xyz)+inShadowTrans[0].xyz;
	#else
		vec3 shadowZ = vec3(0.0, 0.0, 0.0);
	#endif
	
	gl_Position = vec4(shadowZ*2.0-1.0, 1.0);
}
