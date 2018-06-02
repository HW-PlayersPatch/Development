-- test battle scar type

-- constants (to be binded by the code)
TO_Random			= 0;
TO_ShipAligned			= 1;

-- variables

type 		= "POINT";
version		= 3;
radius 		= 25;
scarProbability = 1;
shallowAngleDeg = 60;
minScarDist	= 5;
textureOrient	= TO_ShipAligned;
textures =
{

	{ "bullet/bullet_pock_01.tga", 25},
	{"bullet/bullet_pock_02.tga", 25},
	{"bullet/bullet_pock_03.tga", 25},
	{"bullet/bullet_pock_04.tga", 25},
	{"bullet/bullet_pock_05.tga", 25},
	{"bullet/bullet_scrape_02.tga", 25},
	{"bullet/bullet_scrape_03.tga", 25},
	{"bullet/bullet_scrape_04.tga", 25}
}
fxProbability = 1;
fxs =
{
{"dmg_sml_missle_combo", 20,TT_HeavyDamage},
}
