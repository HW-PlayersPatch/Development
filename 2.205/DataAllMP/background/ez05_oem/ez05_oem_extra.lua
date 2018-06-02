usesharp = 1.0 -- load a 2nd sharper environment map?

draw_pre = 1.0
draw_sphere = 0.0
draw_stars = 1.0
draw_post = 1.0
clear_depth = 0.0

sun = 
{
    position = { -4, 450, -5700 },
		follow = "Flare_Key",
    rayBoost = 1.241,    -- AFTER the god rays math has been done and bound to 'brighter than base pixel' - we mult the difference by this, and add.
    rayDensity = 0.61,    -- The 'distance' towards the center, as a percentage, that a ray will go from it's original spot on screen.  This effectively controls the max length of rays - lower numbers are less GPU intensive for many reasons.
    rayExposure = 0.735,    -- Per ray we have to average all of the pixels we touch, this scales the final value - affecting where god rays tend to over-brighten the background.
    rayFalloff = 0.25,    -- The weight from start to finish of a ray's samples.  Hard to explain.
    rayArcRange = { 12.0, 24.0, 64.0, 0.25 },    -- The 'arc' size of the area that spawns rays - Inner, Outer (min), Outer (max), Bias.  This 'cone' animates...
    rayArcMotion = { 0.04, 0.17 },    -- Speed of the 2 octaves of noise that control the radial cone animation.
    rayArcCurve = { 5.0, 0.75 },    -- The falloff curve of the arc at outer min/max.
}

ship_gamma =
{
	gammaCurves = { 0.68625, 0.68625, 0.68625 }, -- ship gamma
	gammaScale = 1.35 -- bloom headroom
}

bloom =
{
	lumiMin = { 0.299, 0.587, 0.114 },	-- RGB to Lumi
	lumiMax = { 0.299, 0.587, 0.114 },
	inMin = { 0.68, 1.3, 1.6 }, -- Thresh, Boost, Curve
	inMax = { 0.68, 1.3, 1.6 },
	outMin = { 0.8, 0.75, 0.3 }, -- Mask, Curve, Scale
	outMax = { 0.8, 0.75, 0.3 },
	
	nodes = {
		{
			direction = { 57.2291, 43.5857, -69.4631 },
			faceIn = 1.01,
			faceOut = -1.01,
			bloomIn = 1.0,
			bloomOut = 1.0
		}
	}
}

post_offset =
{
    global_scale = { 0, 0, 0 },
    delta_scale = { 0.000035, 0.000035, 0.000035 },
    delta_radius = 8,
    delta_curve = 1,
}

anims = {
	{
		Anim_Name = "PlanetSpin",
		Anim_Loops = -1,
		Anim_Rate = 0.0007;
	},
}
