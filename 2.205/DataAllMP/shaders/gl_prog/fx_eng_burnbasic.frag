smooth in vec4 outCol0;
smooth in vec2 outUV0;

uniform sampler2D inTexSprite;

layout (location = 0) out vec4 finalCol0;

#ifdef DEPTH_BIAS
smooth in float outOfs;
smooth in float outPush;
uniform sampler2D inTexDepth;
uniform vec4 inDepth;
uniform vec4 inWindow;

float znear = inDepth.x;
float zfar = inDepth.y;

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));
	return ret;
}
#endif

void main()
{
	vec4 spriteTex = texture(inTexSprite, outUV0);
	spriteTex.rgb *= 2.0;
	vec4 spriteCol = spriteTex*outCol0;
	
#ifdef DEPTH_BIAS
	vec2 uvD = gl_FragCoord.xy*inWindow.zw;
	float depthZbuf = linearize(texture(inTexDepth, uvD).x);
	float depthZfrag = linearize(gl_FragCoord.z);
	
	float ringLumiC = dot(spriteTex.rgb, vec3(0.35, 0.35, 0.35));
	float ringLumi = pow(min(ringLumiC, 1.0), 0.5);
	
	float ringDepth = outOfs;						// Intended half depth of entire ring
	float ringSlice = ringLumi*ringDepth;			// This pixel's half depth
	float ringCore = depthZfrag+outPush;			// Center of ring volume
	float ringNear = ringCore-ringSlice;
	float eyeIntrude = clamp(outPush/ringSlice, 0.0, 1.0);		// How much did the eye push into the pixel volume? (inverse)
	float depthIntrude = clamp(outPush/ringDepth, 0.0, 1.0);				// How much did the eye push into the total volume?
	float intrudeDegree = eyeIntrude;//(eyeIntrude+depthIntrude)*0.5;
	
	float depthOpacity = clamp((depthZbuf-ringNear)/(ringSlice*2.0), 0.0, 1.0)*intrudeDegree;	
	
	// This isn't correct (darking RGB on alpha blend) - but it _looks_ great with most alpha textures
	// Smoke grows dark against surfaces as it fades, etc.  So let's keep it...
	spriteCol.rgb = spriteCol.rgb*depthOpacity;
	spriteCol.a = spriteCol.a*depthOpacity;
	
#endif
	
	finalCol0 = spriteCol;
}
