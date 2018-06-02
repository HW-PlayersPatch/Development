smooth in vec2 outUV0;

uniform sampler2D inTexColor;

layout (location = 0) out vec4 finalCol0;

//add		frag_text		#define GAUSS_X
//add		frag_text		#define GAUSS_M

void main() 
{
	vec2 tS = textureSize(inTexColor,0);
	float mulX = 1.0/tS.x;
	float mulY = 1.0/tS.y;
		
	vec4 accumC = vec4(0.0);
	
	#ifdef GAUSS_S
	{
		//0.09672	0.240449	0.325661
		#ifdef GAUSS_X
		float ofsX = 1.2868591122*mulX;
		float ofsY = 0.0;
		#endif
		
		#ifdef GAUSS_Y
		float ofsX = 0.0;
		float ofsY = 1.2868591122*mulY;
		#endif
		
		accumC += texture(inTexColor, outUV0-vec2(ofsX, ofsY))*0.337169;
		accumC += texture(inTexColor, outUV0)*0.325661;
		accumC += texture(inTexColor, outUV0+vec2(ofsX, ofsY))*0.337169;
	}
	#endif
	
	#ifdef GAUSS_M
	{
		//0.008488	0.038078	0.111165	0.211357	0.261824
		#ifdef GAUSS_X
		float ofsX1 = 3.1822789*mulX;
		float ofsX0 = 1.3446742*mulX;
		float ofsY0 = 0.0;
		float ofsY1 = 0.0;
		#endif
		
		#ifdef GAUSS_Y
		float ofsX1 = 0.0;
		float ofsX0 = 0.0;
		float ofsY0 = 1.3446742*mulY;
		float ofsY1 = 3.1822789*mulY;
		#endif
		
		accumC += texture(inTexColor, outUV0-vec2(ofsX1, ofsY1))*0.046566;
		accumC += texture(inTexColor, outUV0-vec2(ofsX0, ofsY0))*0.322522;
		accumC += texture(inTexColor, outUV0)*0.261824;
		accumC += texture(inTexColor, outUV0+vec2(ofsX0, ofsY0))*0.322522;
		accumC += texture(inTexColor, outUV0+vec2(ofsX1, ofsY1))*0.046566;
	}
	#endif
	
	#ifdef GAUSS_L
	{
		//0.003924	0.008962	0.018331	0.033585	0.055119	0.081029	0.106701	0.125858	0.13298
		#ifdef GAUSS_X
		float ofsX3 = 7.3045165*mulX;
		float ofsX2 = 5.3530896*mulX;
		float ofsX1 = 3.4048461*mulX;
		float ofsX0 = 1.4588126*mulX;
		float ofsY0 = 0.0;
		float ofsY1 = 0.0;
		float ofsY2 = 0.0;
		float ofsY3 = 0.0;
		#endif
		
		#ifdef GAUSS_Y
		float ofsX3 = 0.0;
		float ofsX2 = 0.0;
		float ofsX1 = 0.0;
		float ofsX0 = 0.0;
		float ofsY0 = 1.4588126*mulY;
		float ofsY1 = 3.4048461*mulY;
		float ofsY2 = 5.3530896*mulY;
		float ofsY3 = 7.3045165*mulY;
		#endif
		
		accumC += texture(inTexColor, outUV0-vec2(ofsX3, ofsY3))*0.012886;
		accumC += texture(inTexColor, outUV0-vec2(ofsX2, ofsY2))*0.051916;
		accumC += texture(inTexColor, outUV0-vec2(ofsX1, ofsY1))*0.136148;
		accumC += texture(inTexColor, outUV0-vec2(ofsX0, ofsY0))*0.232559;
		accumC += texture(inTexColor, outUV0)*0.13298;
		accumC += texture(inTexColor, outUV0+vec2(ofsX0, ofsY0))*0.232559;
		accumC += texture(inTexColor, outUV0+vec2(ofsX1, ofsY1))*0.136148;
		accumC += texture(inTexColor, outUV0+vec2(ofsX2, ofsY2))*0.051916;
		accumC += texture(inTexColor, outUV0+vec2(ofsX3, ofsY3))*0.012886;
	}
	#endif
	
	#ifdef GAUSS_DEF
	{
		//0.09672	0.240449	0.325661
		accumC += texture(inTexColor, outUV0-vec2(1.2868591122*mulX, 0.0))*0.337169;
		accumC += texture(inTexColor, outUV0)*0.325661;
		accumC += texture(inTexColor, outUV0+vec2(1.2868591122*mulX, 0.0))*0.337169;
	}
	#endif
	
	finalCol0 = accumC;
}
