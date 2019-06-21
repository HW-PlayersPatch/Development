modName = "v2.3 Players Patch"
modBuild = "10"

function UI_DisplayBuild()
    return {
		type = "Frame",
		
		Layout = {
			sector = 1,
			pos_XY = { x = 0.95, y = 0.95, xr = "scr", yr = "scr" },
			size_WH = { w = 0.0, h = 0.0, wr = "px", hr = "px" },
			pivot_XY = { 1.0, 1.0 },
		},
		
		name = "VersionFrame",
		autosize = 1,
		sizetype = "contain",
		arrangetype = "horiz",
		
		BackgroundGraphic = {
			texture = "DATA:UI\\NewUI\\Elements\\ui_textshadow.tga",
			uvRect = { 4/32, 4/32, 28/32, 28/32 },
			patch_X = { 9, -6, 9, 0 },
			patch_Y = { 9, -6, 9, 0 },
			patch_PadX = { 8, -8 },
			patch_PadY = { 4, -4 },
			patch_Scale = 1,
		};
		
		-- Build Number
		{
			type = "TextLabel",
			name = "lblBuildNumber",
			visible = 1,
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = 0.0, h = 0.0, wr = "px", hr = "px" },
				pivot_XY = { 0.0, 0.0 },
			},
			
			autosize = 1,
			sizetype = "contain",
			ignored = 1,
			--Uncomment to hide...
			--visible = 0,
			
			Text = {				
				font = "ListBoxItemFont",
				vAlign = "Top",
				color = {255,255,255,255},
			},
		},
		
		-- Version number
		{
			type = "TextLabel",
			name = "lblVersion",
			
			Layout = {
				pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },
				size_WH = { w = 0.0, h = 0.0, wr = "px", hr = "px" },
				pivot_XY = { 0.0, 0.0 },
			},
			
			autosize = 1,
			visible=1,
			
			Text = {	
				text = "v2.1" .. " + " .. modName .. " | build " .. modBuild,
				font = "ButtonFont",
				vAlign = "Top",
				color = {119,166,191,255},
			},
		},
    }
end