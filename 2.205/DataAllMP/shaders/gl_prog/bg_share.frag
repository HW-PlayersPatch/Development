uniform vec4 inBackExps;	//br, bR, Br, BR

#ifdef BG_POST_B0R0
vec4 getBackExp(){ return vec4(inBackExps.x); }
#endif

#ifdef BG_POST_B0R1
vec4 getBackExp(){ return vec4(inBackExps.y); }
#endif

#ifdef BG_POST_B1R0
vec4 getBackExp(){ return vec4(inBackExps.z); }
#endif

#ifdef BG_POST_B1R1
vec4 getBackExp(){ return vec4(inBackExps.w); }
#endif
