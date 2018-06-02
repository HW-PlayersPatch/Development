usesharp = 1.0 -- load a 2nd sharper environment map?

draw_pre = 1.0
draw_sphere = 0.0
draw_stars = 1.0
draw_post = 1.0
clear_depth = 0.0

sun = 
{
    position = { 6.85, -0.15, -1.55 },
    godRaysColor = { .607, .541, .641, .1 }, -- color of the god rays core
    godRaysParams = { 1.9, 0.219, 0.31, 0.99 }, --Density, Weight, Exposure, Decay
    godRaysNumBlurPasses = 5, -- must to be int. Don't put too big values, because that will impact performance
    size = 35.0 -- a sun blob radius (core of the god rays) }


}

ship_gamma =
{
	gammaCurves = { 0.68625, 0.68625, 0.68625 }, -- ship gamma
	gammaScale = 1.09 -- bloom headroom
}

bloom =
{
	lumiMin = { 0.299, 0.587, 0.114 },	-- RGB to Lumi
	lumiMax = { 0.299, 0.587, 0.114 },
	inMin = { 0.5, 0.5, 0.5 }, -- Thresh, Boost, Curve
	inMax = { 0.5, 0.5, 0.5},
	outMin = { 0.15, 1.05, 0.35 }, -- Mask, Curve, Scale
	outMax = { 0.15, 1.15, 0.95 },
	
	nodes = {
		{
			direction = { 6.85, -0.15, -1.55  },
			faceIn = 1.01,
			faceOut = -1.01,
			bloomIn = 1.0,
			bloomOut = 1.0
		}
	}
}

env =
{

refl_scale=0.95483

}