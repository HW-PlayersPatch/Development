#version 330

smooth in vec2 outUV0;
smooth in vec2 outUV1;
smooth in float outTimeOfs;

uniform sampler2D inTexColor;
uniform sampler2D inTexDepth;

uniform vec4 inMouse;
uniform vec4 inWindow;
uniform vec4 inTime;
uniform vec4 inDepth;
uniform vec4 inLens;
uniform vec4 inConfig;

layout (location = 0) out vec4 finalCol0;

#define PI  3.14159265

float width = inWindow.x; //texture width
float height = inWindow.y; //texture height
vec2 texel = vec2(inWindow.z, inWindow.w);

float focalDepthN = inLens.x;
float focalDepthF = inLens.y; 
float focalLength = inLens.z;
float focalStop = inLens.w;

float boostNear = inConfig.x;
float boostFar = inConfig.y;
float scaleNear = inConfig.z;
float scaleFar = inConfig.w;

float znear = inDepth.x;
float zfar = inDepth.y;

int samples = 5; //samples on the first ring
int rings = 7; //ring count

float CoC = 0.03; // 35mm film = 0.03

float threshold = 0.5; //highlight threshold;
float gain = 2.0; //highlight gain;

float bias = 0.95; //bokeh edge bias
float fringe = 0.001; //bokeh chromatic aberration/fringing

float namount = 0.0001; //dither amount

vec3 color(vec2 coords,float blur) //processing the sample
{
	vec3 col = vec3(0.0);
	
	col.r = texture(inTexColor,coords + vec2(0.0,1.0)*texel*fringe*blur).r;
	col.g = texture(inTexColor,coords + vec2(-0.866,-0.5)*texel*fringe*blur).g;
	col.b = texture(inTexColor,coords + vec2(0.866,-0.5)*texel*fringe*blur).b;
	
	vec3 lumcoeff = vec3(0.299,0.587,0.114);
	float lum = dot(col.rgb, lumcoeff);
	float thresh = max((lum-threshold)*gain, 0.0);
	return col+mix(vec3(0.0),col,thresh*blur);
}

vec2 rand(vec2 coord) //generating noise/pattern texture for dithering
{
	float noiseX = clamp(fract((sin(dot(coord ,vec2(12.9898,78.233)))+outTimeOfs) * 43758.5453),0.0,1.0)*2.0-1.0;
	float noiseY = clamp(fract((sin(dot(coord ,vec2(12.9898,78.233)*2.0))+outTimeOfs) * 43758.5453),0.0,1.0)*2.0-1.0;
	return vec2(noiseX,noiseY);
}

float linearize(float depth)
{
	float z_n = 2.0 * depth - 1.0;    
	float ret = 2.0 * znear * zfar / (zfar + znear - z_n * (zfar - znear));
	return ret;
}

void main() 
{
	float fieldScale = 0.25;	// Compress our units before the math (can help with windowing)
	float depth = linearize(texture(inTexDepth,outUV0.xy).x);
	
	float stop = focalStop;
	float f = focalLength*fieldScale;
	float dN = focalDepthN*fieldScale;
	float dF = focalDepthF*fieldScale;
	float o = depth*fieldScale;
		
	float blur = 0.0f;
	float a = (o*f)/(o-f);
	
	if (o < dN)
	{
		float b = (dN*f)/(dN-f);
		float c = (dN-f)/(dN*stop*CoC);
		blur = clamp(abs(a-b)*c*boostNear,0.0,1.0)*scaleNear;
	}
	else if (o > dF)
	{
		float b = (dF*f)/(dF-f);
		float c = (dF-f)/(dF*stop*CoC);
		blur = clamp(abs(a-b)*c*boostFar,0.0,1.0)*scaleFar;
	}
	
	vec3 col = vec3(0.0);
	
	if(blur < 0.05) //some optimization thingy
	{
		col = texture(inTexColor, outUV0.xy).rgb;
	}
	else
	{
		vec2 noise = rand(outUV0.xy)*namount*blur;
	
		float w = texel.x*blur+noise.x;
		float h = texel.y*blur+noise.y;
		
		col = texture(inTexColor, outUV0.xy).rgb;
		float s = 1.0;
		int ringsamples;
		
		for (int i = 1; i <= rings; i += 1)
		{   
			ringsamples = i * samples;
			
			for (int j = 0 ; j < ringsamples ; j += 1)
			{
				float step = PI*2.0 / float(ringsamples);
				float pw = (cos(float(j)*step)*float(i));
				float ph = (sin(float(j)*step)*float(i));
				float p = 1.0;
				
				col += color(outUV0.xy + vec2(pw*w,ph*h),blur)*mix(1.0,(float(i))/(float(rings)),bias)*p;  
				s += 1.0*mix(1.0,(float(i))/(float(rings)),bias)*p;   
			}
		}
		col /= s;
	}
	
	finalCol0.rgb = col;
	finalCol0.a = 1.0;
}