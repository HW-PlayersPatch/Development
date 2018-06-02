usesharp = 1.0 -- load a 2nd sharper environment map?

draw_pre = 1.0
draw_sphere = 0.0
draw_stars = 1.0
draw_post = 1.0
clear_depth = 0.0


sun = 
{
    position = { -1167.378, 9906.150, 710.922 }, 
    rayBoost = 1.1,    -- AFTER the god rays math has been done and bound to 'brighter than base pixel' - we mult the difference by this, and add.
    rayDensity = 0.9,    -- The 'distance' towards the center, as a percentage, that a ray will go from it's original spot on screen.  This effectively controls the max length of rays - lower numbers are less GPU intensive for many reasons.
    rayExposure = 0.85,    -- Per ray we have to average all of the pixels we touch, this scales the final value - affecting where god rays tend to over-brighten the background.
    rayFalloff = 0.05,    -- The weight from start to finish of a ray's samples.  Hard to explain.
    rayArcRange = { 2.0, 12.0, 92.0, 0.5 },    -- The 'arc' size of the area that spawns rays - Inner, Outer (min), Outer (max), Bias.  This 'cone' animates...
    rayArcMotion = { 0.3, 0.0961 },    -- Speed of the 2 octaves of noise that control the radial cone animation.
    rayArcCurve = { 2.5, 1.2 },    -- The falloff curve of the arc at outer min/max.
}

ship_gamma =
{
                gammaCurves = { 0.7836, 0.7836, 0.7836 }, -- ship gamma
                gammaScale = 1.42 -- bloom headroom
}
 
bloom =
{
                lumiMin = { 0.299, 0.587, 0.114 },               -- RGB to Lumi
                lumiMax = { 0.299, 0.587, 0.114 },
                inMin = { 0.8, 1.3, 1.2 }, -- Thresh, Boost, Curve
                inMax = { 0.8, 1.3, 1.4 },
                outMin = { 0.8, 0.75, 0.53 }, -- Mask, Curve, Scale
                outMax = { 0.8, 0.75, 0.53 },
               
}
 
post_offset =
{
    global_scale = { 0, 0, 0 },
    delta_scale = { -0.000005, -0.000005, -0.000005 },
    delta_radius = 3,
    delta_curve = 1,
}
 
env =
{
 
refl_scale=0.95483
 
}