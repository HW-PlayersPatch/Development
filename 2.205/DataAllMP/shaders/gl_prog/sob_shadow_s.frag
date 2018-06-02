smooth in vec2 outUV0;

uniform sampler2D inTexScissor;

layout (location = 0) out vec4 finalCol0;

void main()
{
	vec3 texScissor = texture(inTexScissor, outUV0).xyz;
	
	if (texScissor.r < 0.5)
	{
		discard;
	}

	finalCol0 = vec4(0.0);
}
