dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
dofilepath("data:ui/newui/Examples/ExampleIncludes.lua")
dofilepath("data:ui/newui/Background/logo.lua")
dofilepath("data:ui/newui/Main/ExButtons.lua")
dofilepath("data:build.lua")


OptionsButton = [[
	-- Resets the additional slider positions
	UI_ReloadScreen("FEGameOptions");
	
	-- Open Options
	UI_ShowScreen("FEGameOptions", eTransition);
]]


LAYOUT_MENU_BUTTONS = 
{
	min_WH = {	w = 1, wr = "par"},	
	pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
	pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
}

LAYOUT_MENU_OUTLINED_BUTTONS = 
{
	--min_WH = {	w = 1, wr = "par"},	
	pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
	pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
	min_WH = {	w = 1, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr" },						
}

LAYOUT_EXIT_BUTTON = 
{
	min_WH = {	w = NAVIGATION_BUTTON_WIDTH, wr = "scr"},	
	pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
	pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
	pivot_XY = { 1.0, 0.0 },					
	pos_XY = {	x=1.0, xr="par"},	
		
}


-- Updated options button
BTN_OPTIONS				= NewMenuButton("btnOptions",		"$2607",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	OptionsButton)


-- LUA CONFIG FOR THE MAIN MENU UISCREEN

NewMainMenu = {
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		backgroundColor = {0,0,0,0}, -- black background for letterbox effect -- GBX:pdeupree - Changed alpha to 0 so setting in "Background.lua" shows up.
	},
	Layout = {
		sector = 1,
		pos_XY = {	x = 0, y = 0, xr = "scr",	yr = "scr"	},	
		size_WH = {	w = 1.0, h = 1.0, wr = "scr", hr = "scr" },							
	},		

	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	--UINavDefaultSelectedElementName = "lstBoxChat2",
	UINavDefaultSelectedElementName = "btnTutorial",

	--Hotkeys = {
	--	{ "FE_ExitToWindows()",INKE_KeyDown, 0, "Exit to operating system",    { ALTKEY, F4KEY } },
	--},
	;
	{
		type = "Frame",
		name = "Root_Frame",
		
		Layout = {	
				pos_XY = LAYOUT_TOPLEFTSCREEN,		
				size_WH = LAYOUT_FILLSCREEN,
			},	

--		BackgroundGraphic = {
--			size = { 800, 400 },
--			texture = "DATA:UI/NewUI/Background/load_background.mres",
--			textureUV = { 0, 56, 800, 455},
--		},
-- GBX:pdeupree - Uncomment the video here if you want to have a first main menu background video that is different than the rest.
--		BackgroundVideo = {
--			filenameV = "data:animatics/mainmenu.webm",
--			loop = 1,
--			fitScreen = 1,
--			fixedAspectRatio = 1,
--		},

	
	;

	},
	--EXAMPLE_SCREENS, -- BB - Comment this out before shipping				
	--EXAMPLE_UITOOLBUTTONS,		-- Buttons
	
	-------- LOGO -------
	BACKGROUND_LOGO,
	
	----------------------------------- MAIN MENU  -----------------------------------
	-- Panel frame
	{
		type = "RmWindow",
		name = "MainMenu_Panel",
		WindowTemplate = PANEL_WINDOWSTYLE,
		TitleText = "$2617", -- "MAIN MENU",

		Layout = {					
				pos_XY = { x=1, y = .42,  xr="par", yr = "par" },	
				margin_RB = { r = 32/540, b = 0, rr = "scr", br = "scr" },
				pivot_XY = { 1,  .5 },		
		},	
				
		autosize  = 1,
		autoarrange = 1,
		sizetype = "contain",		
		;	
	
		{
			type = "Frame",
			autosize = 1,		
			autoarrange = 1,
			autoarrangeSpace = 0,
			UINavSelectable = 1, 
			;			
			-- Button Frame
			{
				type = "Frame",

				borderColor = "FEColorOutline",
				autosize = 1,
				autoarrange = 1,

				arrangetype = "vert",
				arrangeSep = {	x=0, y= 4/540, xr="scr", yr="scr"},
				UINavSelectable = 1, 
				--UINavLoopChildSelection = 1,
				;
				--Level Drop Down List Box	
				--NewMenuButton("btnStartGame",		"$2601",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	"UI_StartGameWithSelectedLevel(); "),
			    --{
				--	type = "DropDownListBox",			
					--min_WH = {	w = 1, wr = "par"},	
				--	Layout = {
				--		size_WH = {w = .5, h = 24, wr = "par", hr = "px",},	
				--		pivot_XY = { 1.0, 0.0 },					
				--		pos_XY = {	x=1.0, xr="par"},	
				--	},
				--	autosize=1,
				--	name = "listLevels",	
				--},

				--            _name,               _text, _helptip, _hotkeyID, _layout,             _style, _mouseclicked, _visible, Next, Up, Right, Down, Left 																									       
				NewMenuButton("btnTutorial",		"$2602",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	nil, 1, "btnCampaign", nil, nil, nil, nil),
				CampainButton(),
				NewMenuButton("btnExtra",			"$2606",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	nil, 1, nil, nil, nil, nil, nil),
				NewMenuButton("btnPlayerVsCPU",		"$2604",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	nil),
				MPButton(),
				NewMenuButton("btnProfile",		"$2616",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	[[UI_SetNextScreen("UserProfile", "NewMainMenu");UI_SetPreviousScreen("UserProfile", "NewMainMenu");UI_ShowScreen("UserProfile", eTransition);]]),
				-- Updated options
				BTN_OPTIONS,
				NewMenuButton("btnMovies",		"$2608",	nil,	0,	LAYOUT_MENU_BUTTONS,	"FEButtonStyle1",	"UI_ShowScreen(\"PlayMoviesScreen\", eTransition)"),
				
			
				-- Spacer (This keeps the width as well)
				{
					type = "Frame",
					size = {200, 10},
				},		

				NewMenuButton("btnExit",		"$2609",	nil,	0,	LAYOUT_EXIT_BUTTON,	"FEButtonStyle1_Alert_Chipped",	"UI_ExitApp();"),

			},
		
			-- bottom Spacer
			{
				type = "Frame",
				size = {200,4},
			},
		},
	
	},
	

	-- Comment out this frame if you dont want the build info...
	--{
	--	type = "Frame",
	--	autosize = 1,
	--	position = {2, 600 - 15},
	--	;
		
		-- Build/Version Info
		UI_DisplayBuild()
	--},
}