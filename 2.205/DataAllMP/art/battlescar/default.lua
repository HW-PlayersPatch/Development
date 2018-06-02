-- test battle scar type

-- constants (to be binded by the code)
TO_Random			= 0;
TO_ShipAligned			= 1;
TT_HeavyDamage			= 1;

-- variables

type 		= "POINT";
version		= 3;
radius 		= 8;
scarProbability = 1;
shallowAngleDeg = 60;
minScarDist	= 5;
textureOrient	= TO_Random;
textures =
{
	{"Hgn_Torpedo/Torpedo_01.tga", 25},
	{"Hgn_Torpedo/Torpedo_02.tga", 25},
	{"Hgn_Torpedo/DecalBurn01.tga", 25},
	{"Hgn_Torpedo/DecalBurn02.tga", 25},
	{"Hgn_Torpedo/DecalCrash.tga", 25},
	{"bullet/bullet_pock_01.tga", 25},
	{"bullet/bullet_pock_02.tga", 25},
	{"bullet/bullet_pock_03.tga", 25},
	{"bullet/bullet_pock_04.tga", 25},
	{"bullet/bullet_pock_05.tga", 25},
	{"bullet/bullet_scrape_02.tga", 25},
	{"bullet/bullet_scrape_03.tga", 25},
	{"bullet/bullet_scrape_04.tga", 25}
}
heavyDamageTextures =
{
	{ "bullet/Explosion.tga", 25 },
	{"Hgn_Torpedo/Torpedo_01.tga", 35},
	{"Hgn_Torpedo/Torpedo_02.tga", 25},

}

fxProbability = 1;

fxs =
{
{"dmg_battlescar_explosion_combo", 1,TT_HeavyDamage},
}
