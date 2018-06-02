smooth in vec2 outUV0;
smooth in vec2 outUV1;

uniform sampler2D inTexScene;
uniform sampler2D inTexColor;

uniform vec4 inMouse;
uniform vec4 inWindow;
uniform vec4 inTime;

uniform vec4 inLightSrc;
uniform vec4 inRayShape;

layout (location = 0) out vec4 finalCol0;

void main() 
{
	vec3 base = texture(inTexColor, outUV0).rgb;
	
	vec2 srcPos = vec2(inLightSrc.xy);
	vec2 nowPos = vec2(outUV0);
	vec2 deltPos = nowPos-srcPos;
	
	deltPos *= inRayShape.y;

	float weight = 1.0;	
	vec3 accum = vec3(0.0);
	
	int steps = int(inRayShape.x);
	for (int i=0; i<steps; i++)
	{
		accum += texture(inTexColor, nowPos).rgb*weight;
		nowPos -= deltPos;
		
		weight *= inRayShape.z;
	}
	
	accum *= inRayShape.w;
	
	finalCol0.rgb = texture(inTexScene, outUV0).rgb+max(vec3(0.0), (accum-base)*inLightSrc.w);
	//finalCol0.rgb = max(vec3(0.0), (accum-base)*inLightSrc.w);
	//finalCol0.rgb = accum;
	//finalCol0.rgb = base;
	finalCol0.a = 1;
}