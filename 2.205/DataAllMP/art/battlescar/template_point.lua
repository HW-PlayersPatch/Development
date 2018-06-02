-- test battle scar type

-- constants (to be binded by the code)
TO_Random			= 0;
TO_ShipAligned			= 1;

-- variables

type 		= "POINT";
version		= 2;
radius 		= 6.0;
scarProbability = 1.0;
shallowAngleDeg = 80;
minScarDist	= 5;
textureOrient	= TO_Random;
textures =
{
	{ "hole1.tga", 1.0 },
	{ "hole2.tga", 2.0 }
}
fxProbability = 0.75;
fxs =
{
	"smoke_loop_spray",
	"cloud_ring_combo"
}
