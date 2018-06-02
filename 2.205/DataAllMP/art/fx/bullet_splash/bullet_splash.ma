//Maya ASCII 3.0 scene
//Name: bullet_splash.ma
//Last modified: Thu, Feb 27, 2003 08:13:06 PM
requires maya "3.0";
currentUnit -l centimeter -a degree -t film;
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 18.243503908536272 17.094509401380467 2.9353987990338091 ;
	setAttr ".r" -type "double3" 317.66164727013449 -274.99999999997016 -3.6492772377502517e-014 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 27.148554746297204;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "Root";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
createNode transform -n "polySurface2" -p "Root";
	setAttr ".t" -type "double3" -0.037750204085718053 0.56072731412083088 
		0.02856951482310599 ;
	setAttr ".r" -type "double3" 90 0 0 ;
	setAttr ".rp" -type "double3" 0 -0.88756227632567541 0 ;
	setAttr ".sp" -type "double3" 0 -0.88756227632567541 0 ;
createNode mesh -n "polySurfaceShape2" -p "polySurface2";
	setAttr -k off ".v";
	setAttr -s 3 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 0;
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[0:47]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 0;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr -s 2 ".ciog[0].cog";
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 52 ".uvst[0].uvsp[0:51]" -type "float2" 0.83333337 
		0 0.91666663 0 0.91666663 1 0.83333331 1 1 0 1 1 0.083333373 0 0.083333343 
		1 0.16666663 0 0.16666666 1 0.25 0 0.25 1 0.33333337 0 0.33333331 1 0.41666663 
		0 0.41666666 1 0.5 0 0.5 1 0.58333337 0 0.58333331 1 0.66666663 0 0.66666663 
		1 0.75 0 0.75 1 1.1 0 1.1 1 0.91666663 1 0.91666663 0 0.83333331 1 0.83333337 
		0 1 1 1 0 1.1 1 1.1 0 0.16666666 1 0.16666663 0 0.083333343 1 0.083333373 
		0 0.25 1 0.25 0 0.33333331 1 0.33333337 0 0.41666666 1 0.41666663 0 0.5 1 
		0.5 0 0.58333331 1 0.58333337 0 0.66666663 1 0.66666663 0 0.75 1 0.75 0;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 24 ".pt";
	setAttr ".pt[12:23]" -type "float3" -0.55485779 1.0068841 0.32034636  
		-0.32034633 1.0068841 0.55485612  4.9652593e-009 1.0068841 0.64069498  0.32034633 
		1.0068841 0.55485612  0.55485785 1.0068841 0.32034636  0.64069271 1.0068841 
		4.2618474e-008  0.55485785 1.0068841 -0.32034633  0.32034633 1.0068841 -0.55485612  
		6.7858586e-008 1.0068841 -0.64069498  -0.32034636 1.0068841 -0.55485612  
		-0.55485785 1.0068841 -0.32034633  -0.64069271 1.0068841 1.2413149e-008 ;
	setAttr ".pt[36:47]" -type "float3" -0.55485779 0.977189 0.32034636  
		-0.32034633 0.977189 0.55485612  4.9652593e-009 0.977189 0.64069498  0.32034633 
		0.977189 0.55485612  0.55485785 0.977189 0.32034636  0.64069271 0.977189 
		4.2618474e-008  0.55485785 0.977189 -0.32034633  0.32034633 0.977189 -0.55485612  
		6.7858586e-008 0.977189 -0.64069498  -0.32034636 0.977189 -0.55485612  -0.55485785 
		0.977189 -0.32034633  -0.64069271 0.977189 1.2413149e-008 ;
	setAttr -s 48 ".vt[0:47]"  0.86602527 -1 -0.50000018 0.50000024 
		-1 -0.86602515 7.0780516e-008 -1 -1.0000004 -0.50000012 -1 -0.86602527 -0.86602521 
		-1 -0.50000018 -1.0000004 -1 -4.6566129e-008 -0.86602527 -1 0.50000024 -0.50000012 
		-1 0.86602527 -2.6077032e-008 -1 1.0000004 0.50000024 -1 0.86602533 0.86602533 
		-1 0.50000024 1.0000005 -1 0 2.4977632 0.39490843 -1.4420795 1.4420798 0.39490843 
		-2.4977555 9.6857548e-008 0.39490843 -2.8841681 -1.4420795 0.39490843 -2.4977555 
		-2.4977632 0.39490843 -1.4420795 -2.8841591 0.39490843 -1.9185245e-007 -2.4977632 
		0.39490843 1.4420797 -1.4420795 0.39490843 2.4977553 -1.8626451e-007 0.39490843 
		2.8841681 1.4420797 0.39490843 2.4977555 2.4977634 0.39490843 1.4420797 2.8841593 
		0.39490843 -5.5879354e-008 0.86602527 -0.86632234 -0.50000018 0.50000024 
		-0.86632234 -0.86602515 7.0780516e-008 -0.86632234 -1.0000004 -0.50000012 
		-0.86632234 -0.86602527 -0.86602521 -0.86632234 -0.50000018 -1.0000004 -0.86632234 
		-4.6566129e-008 -0.86602527 -0.86632234 0.50000024 -0.50000012 -0.86632234 
		0.86602527 -2.6077032e-008 -0.86632234 1.0000004 0.50000024 -0.86632234 0.86602533 
		0.86602533 -0.86632234 0.50000024 1.0000005 -0.86632234 0 2.4977632 0.52858609 
		-1.4420795 1.4420798 0.52858609 -2.4977555 9.6857548e-008 0.52858609 -2.8841681 
		-1.4420795 0.52858609 -2.4977555 -2.4977632 0.52858609 -1.4420795 -2.8841591 
		0.52858609 -1.9185245e-007 -2.4977632 0.52858609 1.4420797 -1.4420795 0.52858609 
		2.4977553 -1.8626451e-007 0.52858609 2.8841681 1.4420797 0.52858609 2.4977555 
		2.4977634 0.52858609 1.4420797 2.8841593 0.52858609 -5.5879354e-008;
	setAttr -s 96 ".ed[0:95]"  0 1 0 1 2 
		0 2 3 0 3 4 0 4 5 0 5 
		6 0 6 7 0 7 8 0 8 9 0 
		9 10 0 10 11 0 11 0 0 12 13 
		0 13 14 0 14 15 0 15 16 0 16 
		17 0 17 18 0 18 19 0 19 20 0 
		20 21 0 21 22 0 22 23 0 23 12 
		0 0 12 1 1 13 1 2 14 1 3 
		15 1 4 16 1 5 17 1 6 18 1 
		7 19 1 8 20 1 9 21 1 10 22 
		1 11 23 1 12 1 1 13 2 1 14 
		3 1 15 4 1 16 5 1 17 6 1 
		18 7 1 19 8 1 20 9 1 21 10 
		1 22 11 1 23 0 1 24 25 0 25 
		26 0 26 27 0 27 28 0 28 29 0 
		29 30 0 30 31 0 31 32 0 32 33 
		0 33 34 0 34 35 0 35 24 0 36 
		37 0 37 38 0 38 39 0 39 40 0 
		40 41 0 41 42 0 42 43 0 43 44 
		0 44 45 0 45 46 0 46 47 0 47 
		36 0 24 36 1 25 37 1 26 38 1 
		27 39 1 28 40 1 29 41 1 30 42 
		1 31 43 1 32 44 1 33 45 1 34 
		46 1 35 47 1 36 25 1 37 26 1 
		38 27 1 39 28 1 40 29 1 41 30 
		1 42 31 1 43 32 1 44 33 1 45 
		34 1 46 35 1 47 24 1;
	setAttr -s 48 ".fc[0:47]" -type "polyFaces" 
		f 3 -13 36 25 
		mu 0 3 2 3 1 
		f 3 0 -37 -25 
		mu 0 3 0 1 3 
		f 3 -14 37 26 
		mu 0 3 5 2 4 
		f 3 1 -38 -26 
		mu 0 3 1 4 2 
		f 3 -15 38 27 
		mu 0 3 25 5 24 
		f 3 2 -39 -27 
		mu 0 3 4 24 5 
		f 3 -16 39 28 
		mu 0 3 9 7 8 
		f 3 3 -40 -28 
		mu 0 3 6 8 7 
		f 3 -17 40 29 
		mu 0 3 11 9 10 
		f 3 4 -41 -29 
		mu 0 3 8 10 9 
		f 3 -18 41 30 
		mu 0 3 13 11 12 
		f 3 5 -42 -30 
		mu 0 3 10 12 11 
		f 3 -19 42 31 
		mu 0 3 15 13 14 
		f 3 6 -43 -31 
		mu 0 3 12 14 13 
		f 3 -20 43 32 
		mu 0 3 17 15 16 
		f 3 7 -44 -32 
		mu 0 3 14 16 15 
		f 3 -21 44 33 
		mu 0 3 19 17 18 
		f 3 8 -45 -33 
		mu 0 3 16 18 17 
		f 3 -22 45 34 
		mu 0 3 21 19 20 
		f 3 9 -46 -34 
		mu 0 3 18 20 19 
		f 3 -23 46 35 
		mu 0 3 23 21 22 
		f 3 10 -47 -35 
		mu 0 3 20 22 21 
		f 3 -24 47 24 
		mu 0 3 3 23 0 
		f 3 11 -48 -36 
		mu 0 3 22 0 23 
		f 3 -74 -85 60 
		mu 0 3 26 27 28 
		f 3 72 84 -49 
		mu 0 3 29 28 27 
		f 3 -75 -86 61 
		mu 0 3 30 31 26 
		f 3 73 85 -50 
		mu 0 3 27 26 31 
		f 3 -76 -87 62 
		mu 0 3 32 33 30 
		f 3 74 86 -51 
		mu 0 3 31 30 33 
		f 3 -77 -88 63 
		mu 0 3 34 35 36 
		f 3 75 87 -52 
		mu 0 3 37 36 35 
		f 3 -78 -89 64 
		mu 0 3 38 39 34 
		f 3 76 88 -53 
		mu 0 3 35 34 39 
		f 3 -79 -90 65 
		mu 0 3 40 41 38 
		f 3 77 89 -54 
		mu 0 3 39 38 41 
		f 3 -80 -91 66 
		mu 0 3 42 43 40 
		f 3 78 90 -55 
		mu 0 3 41 40 43 
		f 3 -81 -92 67 
		mu 0 3 44 45 42 
		f 3 79 91 -56 
		mu 0 3 43 42 45 
		f 3 -82 -93 68 
		mu 0 3 46 47 44 
		f 3 80 92 -57 
		mu 0 3 45 44 47 
		f 3 -83 -94 69 
		mu 0 3 48 49 46 
		f 3 81 93 -58 
		mu 0 3 47 46 49 
		f 3 -84 -95 70 
		mu 0 3 50 51 48 
		f 3 82 94 -59 
		mu 0 3 49 48 51 
		f 3 -73 -96 71 
		mu 0 3 28 29 50 
		f 3 83 95 -60 
		mu 0 3 51 50 29 ;
	setAttr ".vbc" no;
createNode lightLinker -n "lightLinker1";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
createNode renderLayer -s -n "globalRender";
createNode phong -n "hw2Shader";
	addAttr -ci true -sn "hw2ScriptName" -ln "hw2ScriptName" -dt "string";
	addAttr -ci true -sn "hw2ParamList" -ln "hw2ParamList" -dt "string";
	setAttr ".hw2ScriptName" -type "string" "/shaders/fx.st";
	setAttr ".hw2ParamList" -type "string" "";
createNode shadingEngine -n "hw2ShaderSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" (
		"C:/projects/HW2/Homeworld2/Data/ART/FX/Bullet_Splash/Bullet_splash2.tga");
createNode place2dTexture -n "place2dTexture1";
createNode hyperView -n "hyperView1";
	setAttr ".vl" -type "double2" -180.82638888888903 -692.3857042648707 ;
	setAttr ".vh" -type "double2" 1287.1736111111109 204.6142957351293 ;
createNode hyperView -n "hyperView2";
	setAttr ".p" -type "double2" 655 -15 ;
	setAttr ".vl" -type "double2" -180.82638888888903 -692.3857042648707 ;
	setAttr ".vh" -type "double2" 1287.1736111111109 204.6142957351293 ;
createNode phong -n "hw2Shader1";
	addAttr -ci true -sn "hw2ScriptName" -ln "hw2ScriptName" -dt "string";
	addAttr -ci true -sn "hw2ParamList" -ln "hw2ParamList" -dt "string";
	setAttr ".hw2ScriptName" -type "string" "";
createNode shadingEngine -n "hw2Shader1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" (
		"C:/projects/HW2/Homeworld2/Data/ART/FX/Bullet_Splash/Bullet_splash2.tga");
createNode place2dTexture -n "place2dTexture2";
createNode groupId -n "groupId9";
	setAttr ".ihi" 0;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n"
		+ "//\n"
		+ "//  This script is machine generated.  Edit at your own risk.\n"
		+ "//\n"
		+ "//\n"
		+ "if (`paneLayout -exists $gMainPane`) {\n"
		+ "\tglobal int $gUseScenePanelConfig;\n"
		+ "\tint    $useSceneConfig = $gUseScenePanelConfig;\n"
		+ "\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n"
		+ "\tint    $nPanes = 0;\n"
		+ "\tstring $editorName;\n"
		+ "\tstring $panelName;\n"
		+ "\tstring $itemFilterName;\n"
		+ "\tstring $panelConfig;\n"
		+ "\t//\n"
		+ "\t//  get current state of the UI\n"
		+ "\t//\n"
		+ "\tsceneUIReplacement -update $gMainPane;\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Top View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Top View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"top\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -textureMaxSize 1024\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 0\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 0\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Top View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"top\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -textureMaxSize 1024\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 0\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 0\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Side View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Side View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"side\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -textureMaxSize 1024\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Side View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"side\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -textureMaxSize 1024\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Front View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Front View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"front\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 0\n"
		+ "                -textureMaxSize 1024\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 0\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 1\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Front View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"front\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"wireframe\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 0\n"
		+ "            -textureMaxSize 1024\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 0\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 1\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" \"Persp View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `modelPanel -unParent -l \"Persp View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n"
		+ "                -camera \"persp\" \n"
		+ "                -useInteractiveMode 0\n"
		+ "                -displayLights \"default\" \n"
		+ "                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n"
		+ "                -bufferMode \"double\" \n"
		+ "                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n"
		+ "                -xray 0\n"
		+ "                -displayTextures 1\n"
		+ "                -textureMaxSize 1024\n"
		+ "                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n"
		+ "                -polymeshes 1\n"
		+ "                -subdivSurfaces 0\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 1\n"
		+ "                -grid 1\n"
		+ "                -joints 1\n"
		+ "                -ikHandles 1\n"
		+ "                -deformers 1\n"
		+ "                -dynamics 1\n"
		+ "                -locators 1\n"
		+ "                -dimensions 1\n"
		+ "                -handles 1\n"
		+ "                -pivots 1\n"
		+ "                -textures 1\n"
		+ "                -strokes 0\n"
		+ "                $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l \"Persp View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n"
		+ "            -camera \"persp\" \n"
		+ "            -useInteractiveMode 0\n"
		+ "            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n"
		+ "            -wireframeOnShaded 0\n"
		+ "            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n"
		+ "            -backfaceCulling 0\n"
		+ "            -xray 0\n"
		+ "            -displayTextures 1\n"
		+ "            -textureMaxSize 1024\n"
		+ "            -nurbsCurves 1\n"
		+ "            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n"
		+ "            -subdivSurfaces 0\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 1\n"
		+ "            -grid 1\n"
		+ "            -joints 1\n"
		+ "            -ikHandles 1\n"
		+ "            -deformers 1\n"
		+ "            -dynamics 1\n"
		+ "            -locators 1\n"
		+ "            -dimensions 1\n"
		+ "            -handles 1\n"
		+ "            -pivots 1\n"
		+ "            -textures 1\n"
		+ "            -strokes 0\n"
		+ "            $editorName;\n"
		+ "modelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" \"Outliner\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `outlinerPanel -unParent -l \"Outliner\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"worldList\" \n"
		+ "                -selectionConnection \"modelList\" \n"
		+ "                -showShapes 0\n"
		+ "                -showAttributes 0\n"
		+ "                -showConnected 0\n"
		+ "                -showAnimCurvesOnly 0\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 1\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 0\n"
		+ "                -highlightActive 1\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"defaultSetFilter\" \n"
		+ "                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l \"Outliner\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n"
		+ "        outlinerEditor -e \n"
		+ "            -mainListConnection \"worldList\" \n"
		+ "            -selectionConnection \"modelList\" \n"
		+ "            -showShapes 0\n"
		+ "            -showAttributes 0\n"
		+ "            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n"
		+ "            -autoExpand 0\n"
		+ "            -showDagOnly 1\n"
		+ "            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n"
		+ "            -showUnitlessCurves 1\n"
		+ "            -showCompounds 1\n"
		+ "            -showLeafs 1\n"
		+ "            -showNumericAttrsOnly 0\n"
		+ "            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n"
		+ "            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n"
		+ "            -setFilter \"defaultSetFilter\" \n"
		+ "            -showSetMembers 1\n"
		+ "            -allowMultiSelection 1\n"
		+ "            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n"
		+ "            -displayMode \"DAG\" \n"
		+ "            -expandObjects 0\n"
		+ "            -setsIgnoreFilters 1\n"
		+ "            -editAttrName 0\n"
		+ "            -showAttrValues 0\n"
		+ "            -highlightSecondary 0\n"
		+ "            -showUVAttrsOnly 0\n"
		+ "            -showTextureNodesOnly 0\n"
		+ "            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" \"Graph Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l \"Graph Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"graphEditorList\" \n"
		+ "                -selectionConnection \"graphEditor1FromOutliner\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 1\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n"
		+ "                -mainListConnection \"graphEditor1FromOutliner\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n"
		+ "                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Graph Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"graphEditorList\" \n"
		+ "                -selectionConnection \"graphEditor1FromOutliner\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 1\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 1\n"
		+ "                -doNotSelectNewObjects 0\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n"
		+ "                -mainListConnection \"graphEditor1FromOutliner\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n"
		+ "                -showBufferCurves \"off\" \n"
		+ "                -smoothness \"fine\" \n"
		+ "                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n"
		+ "                -resultUpdate \"delayed\" \n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" \"Dope Sheet\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l \"Dope Sheet\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"animationList\" \n"
		+ "                -selectionConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n"
		+ "            dopeSheetEditor -e \n"
		+ "                -mainListConnection \"dopeSheetPanel1FromOutliner\" \n"
		+ "                -highlightConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n"
		+ "                -showScene 0\n"
		+ "                -hierarchyBelow 0\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Dope Sheet\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n"
		+ "                -mainListConnection \"animationList\" \n"
		+ "                -selectionConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -highlightConnection \"keyframeList\" \n"
		+ "                -showShapes 1\n"
		+ "                -showAttributes 1\n"
		+ "                -showConnected 1\n"
		+ "                -showAnimCurvesOnly 1\n"
		+ "                -autoExpand 0\n"
		+ "                -showDagOnly 0\n"
		+ "                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n"
		+ "                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n"
		+ "                -autoSelectNewObjects 0\n"
		+ "                -doNotSelectNewObjects 1\n"
		+ "                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n"
		+ "                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n"
		+ "                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n"
		+ "                -editAttrName 0\n"
		+ "                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n"
		+ "                -showTextureNodesOnly 0\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n"
		+ "            dopeSheetEditor -e \n"
		+ "                -mainListConnection \"dopeSheetPanel1FromOutliner\" \n"
		+ "                -highlightConnection \"dopeSheetPanel1OutlinerSelection\" \n"
		+ "                -displayKeys 1\n"
		+ "                -displayTangents 0\n"
		+ "                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n"
		+ "                -displayInfinities 0\n"
		+ "                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n"
		+ "                -showSummary 1\n"
		+ "                -showScene 0\n"
		+ "                -hierarchyBelow 0\n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" \"Trax Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l \"Trax Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"ClipEditor\");\n"
		+ "            clipEditor -e \n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Trax Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"ClipEditor\");\n"
		+ "            clipEditor -e \n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" \"Hypergraph\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l \"Hypergraph\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -currentNode \"polySurface2\" \n"
		+ "                -dropTargetNode \"Root\" \n"
		+ "                -dropNode \"polySurface2\" \n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Hypergraph\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -currentNode \"polySurface2\" \n"
		+ "                -dropTargetNode \"Root\" \n"
		+ "                -dropNode \"polySurface2\" \n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" \"Hypershade\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l \"Hypershade\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperShadeEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 1\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"HyperShade\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"VisorEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"Visor\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "visor -reset hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Animation\" -parent \"\" -openDirectories 1  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Character Clips & Poses\" -parent \"Animation\" -type command -cmd \"currentCharacters\" $editorName;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Unused Clips & Poses\" -parent \"Animation\"  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Rendering\" -parent \"\" -openDirectories 1  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Rendering\" -type command -cmd \"ls -type camera -type imagePlane\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Rendering\" -type command -cmd \"ls -type light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultShaderList\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Rendering\" -type command -cmd \"ls -type opticalFX -type shaderGlow\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultTextureList\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Rendering\" -type connectedNodes -cmd \"ls -type defaultRenderUtilityList\" $editorName;\n"
		+ "visor -addFolder -name \"Create\" -parent \"\" -openDirectories 1  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Create\" -type defaultNodes -cmd \"cameraCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Create\" -openFolder 1 -type defaultNodes -cmd \"listNodeTypes \\\"shader/surface\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Volume\" -parent \"Create/Materials\" -type defaultNodes -cmd \"listNodeTypes \\\"shader/volume\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Create\" -type defaultNodes -cmd \"postProcessCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Create\" -openFolder 1 -type defaultNodes -cmd \"listNodeTypes texture\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Create\"  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Color\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/color\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"General\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/general\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Particle\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/particle\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Switch\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/switch\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Project\" -parent \"\" -openDirectories 1 -type directoryCommand -cmd \"currentProjectParentDir()\" $editorName;\n"
		+ "visor -rebuild hyperShadePanel1VisorEd;\n"
		+ ";\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Hypershade\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperShadeEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 1\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"HyperShade\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "\t\t\t$editorName = ($panelName+\"VisorEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"Visor\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "visor -reset hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Animation\" -parent \"\" -openDirectories 1  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Character Clips & Poses\" -parent \"Animation\" -type command -cmd \"currentCharacters\" $editorName;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Unused Clips & Poses\" -parent \"Animation\"  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Rendering\" -parent \"\" -openDirectories 1  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Rendering\" -type command -cmd \"ls -type camera -type imagePlane\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Rendering\" -type command -cmd \"ls -type light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultShaderList\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Rendering\" -type command -cmd \"ls -type opticalFX -type shaderGlow\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultTextureList\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Rendering\" -type connectedNodes -cmd \"ls -type defaultRenderUtilityList\" $editorName;\n"
		+ "visor -addFolder -name \"Create\" -parent \"\" -openDirectories 1  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Create\" -type defaultNodes -cmd \"cameraCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Create\" -openFolder 1 -type defaultNodes -cmd \"listNodeTypes \\\"shader/surface\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Volume\" -parent \"Create/Materials\" -type defaultNodes -cmd \"listNodeTypes \\\"shader/volume\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Create\" -type defaultNodes -cmd \"postProcessCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Create\" -openFolder 1 -type defaultNodes -cmd \"listNodeTypes texture\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Create\"  hyperShadePanel1VisorEd;\n"
		+ "visor -addFolder -name \"Color\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/color\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"General\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/general\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Particle\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/particle\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Switch\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/switch\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Project\" -parent \"\" -openDirectories 1 -type directoryCommand -cmd \"currentProjectParentDir()\" $editorName;\n"
		+ "visor -rebuild hyperShadePanel1VisorEd;\n"
		+ ";\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" \"Visor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l \"Visor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"VisorEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"Visor\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "visor -reset visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Animation\" -parent \"\" -openDirectories 1  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Character Clips & Poses\" -parent \"Animation\" -type command -cmd \"currentCharacters\" $editorName;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Unused Clips & Poses\" -parent \"Animation\"  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Rendering\" -parent \"\" -openDirectories 1  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Rendering\" -type command -cmd \"ls -type camera -type imagePlane\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Rendering\" -type command -cmd \"ls -type light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultShaderList\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Rendering\" -type command -cmd \"ls -type opticalFX -type shaderGlow\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultTextureList\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Rendering\" -type connectedNodes -cmd \"ls -type defaultRenderUtilityList\" $editorName;\n"
		+ "visor -addFolder -name \"Create\" -parent \"\" -openDirectories 1  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Create\" -type defaultNodes -cmd \"cameraCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes \\\"shader/surface\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Volume\" -parent \"Create/Materials\" -type defaultNodes -cmd \"listNodeTypes \\\"shader/volume\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Create\" -type defaultNodes -cmd \"postProcessCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes texture\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Create\"  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Color\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/color\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"General\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/general\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Particle\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/particle\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Switch\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/switch\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Project\" -parent \"\" -openDirectories 1 -type directoryCommand -cmd \"currentProjectParentDir()\" $editorName;\n"
		+ "visor -rebuild visorPanel1VisorEd;\n"
		+ ";\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Visor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"VisorEd\");\n"
		+ "            hyperGraph -e \n"
		+ "                -orientation \"horiz\" \n"
		+ "                -animateTransition 0\n"
		+ "                -showShapes 0\n"
		+ "                -showDeformers 0\n"
		+ "                -showExpressions 0\n"
		+ "                -showConstraints 0\n"
		+ "                -showUnderworld 1\n"
		+ "                -showInvisible 1\n"
		+ "                -transitionFrames 1\n"
		+ "                -freeform 0\n"
		+ "                -imageEnabled 0\n"
		+ "                -graphType \"Visor\" \n"
		+ "                -updateSelection 1\n"
		+ "                -updateNodeAdded 1\n"
		+ "                $editorName;\n"
		+ "visor -reset visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Animation\" -parent \"\" -openDirectories 1  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Character Clips & Poses\" -parent \"Animation\" -type command -cmd \"currentCharacters\" $editorName;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Character Clips & Poses\" -type command -cmd \"getCharacterPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Unused Clips & Poses\" -parent \"Animation\"  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Clips\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryClips\" $editorName;\n"
		+ "visor -addFolder -name \"Poses\" -parent \"Animation/Unused Clips & Poses\" -type command -cmd \"getLibraryPoses\" $editorName;\n"
		+ "visor -addFolder -name \"Rendering\" -parent \"\" -openDirectories 1  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Rendering\" -type command -cmd \"ls -type camera -type imagePlane\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Rendering\" -type command -cmd \"ls -type light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultShaderList\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Rendering\" -type command -cmd \"ls -type opticalFX -type shaderGlow\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Rendering\" -openFolder 1 -type connectedNodes -cmd \"ls -type defaultTextureList\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Rendering\" -type connectedNodes -cmd \"ls -type defaultRenderUtilityList\" $editorName;\n"
		+ "visor -addFolder -name \"Create\" -parent \"\" -openDirectories 1  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Cameras\" -parent \"Create\" -type defaultNodes -cmd \"cameraCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Lights\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes light\" $editorName;\n"
		+ "visor -addFolder -name \"Materials\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes \\\"shader/surface\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Volume\" -parent \"Create/Materials\" -type defaultNodes -cmd \"listNodeTypes \\\"shader/volume\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Post Process\" -parent \"Create\" -type defaultNodes -cmd \"postProcessCreateFolder()\" $editorName;\n"
		+ "visor -addFolder -name \"Textures\" -parent \"Create\" -type defaultNodes -cmd \"listNodeTypes texture\" $editorName;\n"
		+ "visor -addFolder -name \"Utilities\" -parent \"Create\"  visorPanel1VisorEd;\n"
		+ "visor -addFolder -name \"Color\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/color\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"General\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/general\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Particle\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/particle\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Switch\" -parent \"Create/Utilities\" -type defaultNodes -cmd \"listNodeTypes \\\"utility/switch\\\"\" $editorName;\n"
		+ "visor -addFolder -name \"Project\" -parent \"\" -openDirectories 1 -type directoryCommand -cmd \"currentProjectParentDir()\" $editorName;\n"
		+ "visor -rebuild visorPanel1VisorEd;\n"
		+ ";\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" \"Texture View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l \"Texture View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Texture View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"multiListerPanel\" \"Multilister\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"multiListerPanel\" -l \"Multilister\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Multilister\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\tif ($useSceneConfig) {\n"
		+ "\t\tscriptedPanel -e -to $panelName;\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" \"Render View\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l \"Render View\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Render View\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" \"Blend Shape\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tblendShapePanel -unParent -l \"Blend Shape\" -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tblendShapePanel -edit -l \"Blend Shape\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" \"Dynamic Relationships\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l \"Dynamic Relationships\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Dynamic Relationships\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextPanel \"devicePanel\" \"Devices\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tdevicePanel -unParent -l \"Devices\" -mbv $menusOkayInPanels ;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tdevicePanel -edit -l \"Devices\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" \"Relationship Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l \"Relationship Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Relationship Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" \"Reference Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l \"Reference Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Reference Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" \"Component Editor\"`;\n"
		+ "\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l \"Component Editor\" -mbv $menusOkayInPanels `;\n"
		+ "\t\t}\n"
		+ "\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l \"Component Editor\" -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n"
		+ "\t}\n"
		+ "\tif ($useSceneConfig) {\n"
		+ "        string $configName = `getPanel -cwl \"Current Layout\"`;\n"
		+ "        if (\"\" != $configName) {\n"
		+ "\t\t\tpanelConfiguration -edit -label \"Current Layout\"\n"
		+ "\t\t\t\t-sc false\n"
		+ "\t\t\t\t-configString \"paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n"
		+ "\t\t\t\t-removeAllPanels\n"
		+ "\t\t\t\t-ap true\n"
		+ "\t\t\t\t\t\"Persp View\"\n"
		+ "\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l \\\"Persp View\\\" -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -textureMaxSize 1024\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l \\\"Persp View\\\" -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -textureMaxSize 1024\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n"
		+ "            setNamedPanelLayout \"Current Layout\";\n"
		+ "        }\n"
		+ "        panelHistory -e -clear mainPanelHistory;\n"
		+ "        setFocus `paneLayout -q -p1 $gMainPane`;\n"
		+ "        sceneUIReplacement -deleteRemaining;\n"
		+ "        sceneUIReplacement -clear;\n"
		+ "\t}\n"
		+ "\tgrid -spacing 5cm -size 12cm -divisions 5 -style 3;\n"
		+ "}\n");
	setAttr ".st" 3;
createNode script -n "animationScriptNode";
	setAttr ".a" -type "string" (
		"playbackOptions -min 1 -max 120 -animationStartTime 1 -animationEndTime 120;");
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 4 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 2 ".u";
select -ne :lightList1;
select -ne :defaultTextureList1;
	setAttr -s 2 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :hyperGraphInfo;
	setAttr -s 2 ".b";
select -ne :hyperGraphLayout;
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".img" -type "string" "";
	setAttr ".ims" 1;
select -ne :ikSystem;
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr "hw2ShaderSG.msg" "lightLinker1.lnk[2].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[3].llnk";
connectAttr "hw2Shader1SG.msg" "lightLinker1.lnk[3].olnk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "file1.oc" "hw2Shader.c";
connectAttr "hw2Shader.oc" "hw2ShaderSG.ss";
connectAttr "polySurfaceShape2.iog" "hw2ShaderSG.dsm" -na;
connectAttr "hw2ShaderSG.msg" "materialInfo1.sg";
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.m" "file1.m";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "Root.msg" "hyperView2.fnd";
connectAttr "file2.oc" "hw2Shader1.c";
connectAttr "hw2Shader1.oc" "hw2Shader1SG.ss";
connectAttr "hw2Shader1SG.msg" "materialInfo2.sg";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.m" "file2.m";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr "hw2ShaderSG.pa" ":renderPartition.st" -na;
connectAttr "hw2Shader1SG.pa" ":renderPartition.st" -na;
connectAttr "hw2Shader.msg" ":defaultShaderList1.s" -na;
connectAttr "hw2Shader1.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "hyperView1.msg" ":hyperGraphInfo.b[3]";
connectAttr "hyperView2.msg" ":hyperGraphInfo.b[4]";
// End of bullet_splash.ma
