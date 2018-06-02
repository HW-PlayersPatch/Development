uniform vec4 inShipExps;	//br, bR, Br, BR

#ifdef SOB_POST_B0R0
vec4 getShipExp(){ return vec4(inShipExps.x, inShipExps.x, inShipExps.x, 1.0f); }
#endif

#ifdef SOB_POST_B0R1
vec4 getShipExp(){ return vec4(inShipExps.y, inShipExps.y, inShipExps.y, 1.0f); }
#endif

#ifdef SOB_POST_B1R0
vec4 getShipExp(){ return vec4(inShipExps.z, inShipExps.z, inShipExps.z, 1.0f); }
#endif

#ifdef SOB_POST_B1R1
vec4 getShipExp(){ return vec4(inShipExps.w, inShipExps.w, inShipExps.w, 1.0f); }
#endif
