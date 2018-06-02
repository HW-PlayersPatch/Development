//Maya ASCII 3.0 scene
//Name: abomb mesh.ma
//Last modified: Wed, Jul 16, 2003 01:14:44 AM
requires maya "3.0";
currentUnit -l centimeter -a degree -t ntsc;
createNode transform -s -n "persp";
	setAttr ".t" -type "double3" -10.893628911680915 83.242238077059966 30.845375241588613 ;
	setAttr ".r" -type "double3" 248.06164727027769 186.59999999999033 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v";
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 90.634226660343032;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".t" -type "double3" 0 100 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".t" -type "double3" 0 0 100 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".coi" 100;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".t" -type "double3" 100 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v";
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
createNode transform -n "pSphere1" -p "Root";
	setAttr ".r" -type "double3" 90 0 0 ;
createNode mesh -n "pSphereShape1" -p "pSphere1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".bck" 3;
	setAttr ".vbc" no;
createNode transform -n "pSphere2" -p "Root";
	setAttr ".r" -type "double3" 90 0 0 ;
	setAttr ".s" -type "double3" 1.1667408830206414 1.1667408830206414 1.1667408830206414 ;
createNode mesh -n "pSphereShape2" -p "pSphere2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 84 ".uvst[0].uvsp[0:83]" -type "float2" -1.4314142 
		0.14679426 -1.2382728 0.14679426 -1.0451314 0.14679426 -0.85198998 0.14679426 
		-0.65884858 0.14679426 -0.46570724 0.14679426 -0.27256578 0.14679426 -0.079424307 
		0.14679426 0.11371708 0.14679426 0.3068586 0.14679426 0.5 0.14679426 0.6931414 
		0.14679426 0.8862828 0.14679426 1.0794244 0.14679426 1.2725658 0.14679426 
		1.4657074 0.14679426 1.6588486 0.14679426 1.8519901 0.14679426 2.0451314 
		0.14679426 2.2382729 0.14679426 2.4314144 0.14679426 -1.4314142 0.41585574 
		-1.2382728 0.41585574 -1.0451314 0.41585574 -0.85198998 0.41585574 -0.65884858 
		0.41585574 -0.46570724 0.41585574 -0.27256578 0.41585574 -0.079424307 0.41585574 
		0.11371708 0.41585574 0.3068586 0.41585574 0.5 0.41585574 0.6931414 0.41585574 
		0.8862828 0.41585574 1.0794244 0.41585574 1.2725658 0.41585574 1.4657074 
		0.41585574 1.6588486 0.41585574 1.8519901 0.41585574 2.0451314 0.41585574 
		2.2382729 0.41585574 2.4314144 0.41585574 -1.4314142 0.68491745 -1.2382728 
		0.68491745 -1.0451314 0.68491745 -0.85198998 0.68491745 -0.65884858 0.68491745 
		-0.46570724 0.68491745 -0.27256578 0.68491745 -0.079424307 0.68491745 0.11371708 
		0.68491745 0.3068586 0.68491745 0.5 0.68491745 0.6931414 0.68491745 0.8862828 
		0.68491745 1.0794244 0.68491745 1.2725658 0.68491745 1.4657074 0.68491745 
		1.6588486 0.68491745 1.8519901 0.68491745 2.0451314 0.68491745 2.2382729 
		0.68491745 2.4314144 0.68491745 -1.4314142 0.95397902 -1.2382728 0.95397902 
		-1.0451314 0.95397902 -0.85198998 0.95397902 -0.65884858 0.95397902 -0.46570724 
		0.95397902 -0.27256578 0.95397902 -0.079424307 0.95397902 0.11371708 0.95397902 
		0.3068586 0.95397902 0.5 0.95397902 0.6931414 0.95397902 0.8862828 0.95397902 
		1.0794244 0.95397902 1.2725658 0.95397902 1.4657074 0.95397902 1.6588486 
		0.95397902 1.8519901 0.95397902 2.0451314 0.95397902 2.2382729 0.95397902 
		2.4314144 0.95397902;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 80 ".vt[0:79]"  9.0450888 3.0901697 -2.9389277 7.694212 
		3.0901697 -5.5901723 5.5901718 3.0901697 -7.694212 2.9389274 3.0901697 -9.0450878 
		6.7174668e-008 3.0901697 -9.5105686 -2.9389272 3.0901697 -9.0450878 -5.5901713 
		3.0901697 -7.694211 -7.694211 3.0901697 -5.5901713 -9.0450869 3.0901697 -2.9389272 
		-9.5105667 3.0901697 -1.6156555e-007 -9.0450869 3.0901697 2.9389267 -7.6942105 
		3.0901697 5.5901709 -5.5901709 3.0901697 7.6942096 -2.9389265 3.0901697 9.0450859 
		9.4390884e-008 3.0901697 9.5105658 2.9389265 3.0901697 9.045085 5.5901704 
		3.0901697 7.6942091 7.6942091 3.0901697 5.5901704 9.045085 3.0901697 2.9389262 
		9.5105648 3.0901697 0 8.473979 4.5399051 -2.7533629 7.2083969 4.5399051 -5.2372074 
		5.2372065 4.5399051 -7.2083969 2.7533627 4.5399051 -8.473978 6.2933232e-008 
		4.5399051 -8.9100676 -2.7533622 4.5399051 -8.473978 -5.237206 4.5399051 -7.208396 
		-7.208396 4.5399051 -5.237206 -8.4739771 4.5399051 -2.7533622 -8.9100666 
		4.5399051 -1.5136425e-007 -8.4739771 4.5399051 2.7533619 -7.2083955 4.5399051 
		5.2372055 -5.2372055 4.5399051 7.208395 -2.7533617 4.5399051 8.4739761 8.8431008e-008 
		4.5399051 8.9100657 2.7533617 4.5399051 8.4739761 5.237205 4.5399051 7.2083945 
		7.2083945 4.5399051 5.237205 8.4739752 4.5399051 2.7533615 8.9100647 4.5399051 
		0 7.6942124 5.8778524 -2.5000012 6.5450878 5.8778524 -4.7552848 4.7552843 
		5.8778524 -6.5450878 2.500001 5.8778524 -7.694212 5.7142184e-008 5.8778524 
		-8.0901728 -2.5000007 5.8778524 -7.6942115 -4.7552838 5.8778524 -6.5450869 
		-6.5450869 5.8778524 -4.7552838 -7.694211 5.8778524 -2.5000007 -8.0901718 
		5.8778524 -1.3743586e-007 -7.694211 5.8778524 2.5000005 -6.5450864 5.8778524 
		4.7552834 -4.7552834 5.8778524 6.5450859 -2.5000002 5.8778524 7.6942101 8.0293681e-008 
		5.8778524 8.0901709 2.5000002 5.8778524 7.6942096 4.7552829 5.8778524 6.5450854 
		6.5450854 5.8778524 4.7552829 7.6942091 5.8778524 2.5 8.0901699 5.8778524 
		0 6.7249885 7.0710678 -2.1850812 5.7206168 7.0710678 -4.1562715 4.156271 
		7.0710678 -5.7206168 2.185081 7.0710678 -6.724988 4.9944102e-008 7.0710678 
		-7.0710702 -2.1850808 7.0710678 -6.7249875 -4.1562705 7.0710678 -5.7206159 
		-5.7206159 7.0710678 -4.1562705 -6.724987 7.0710678 -2.1850808 -7.0710697 
		7.0710678 -1.2012335e-007 -6.724987 7.0710678 2.1850805 -5.7206154 7.0710678 
		4.15627 -4.15627 7.0710678 5.7206149 -2.1850803 7.0710678 6.7249861 7.0179254e-008 
		7.0710678 7.0710688 2.1850803 7.0710678 6.7249856 4.1562696 7.0710678 5.7206144 
		5.7206144 7.0710678 4.1562696 6.7249851 7.0710678 2.1850803 7.0710678 7.0710678 
		0;
	setAttr -s 140 ".ed[0:139]"  0 1 0 1 2 
		0 2 3 0 3 4 0 4 5 0 5 
		6 0 6 7 0 7 8 0 8 9 0 
		9 10 0 10 11 0 11 12 0 12 13 
		0 13 14 0 14 15 0 15 16 0 16 
		17 0 17 18 0 18 19 0 19 0 0 
		20 21 1 21 22 1 22 23 1 23 24 
		1 24 25 1 25 26 1 26 27 1 27 
		28 1 28 29 1 29 30 1 30 31 1 
		31 32 1 32 33 1 33 34 1 34 35 
		1 35 36 1 36 37 1 37 38 1 38 
		39 1 39 20 1 40 41 1 41 42 1 
		42 43 1 43 44 1 44 45 1 45 46 
		1 46 47 1 47 48 1 48 49 1 49 
		50 1 50 51 1 51 52 1 52 53 1 
		53 54 1 54 55 1 55 56 1 56 57 
		1 57 58 1 58 59 1 59 40 1 60 
		61 0 61 62 0 62 63 0 63 64 0 
		64 65 0 65 66 0 66 67 0 67 68 
		0 68 69 0 69 70 0 70 71 0 71 
		72 0 72 73 0 73 74 0 74 75 0 
		75 76 0 76 77 0 77 78 0 78 79 
		0 79 60 0 0 20 1 1 21 1 2 
		22 1 3 23 1 4 24 1 5 25 1 
		6 26 1 7 27 1 8 28 1 9 29 
		1 10 30 1 11 31 1 12 32 1 13 
		33 1 14 34 1 15 35 1 16 36 1 
		17 37 1 18 38 1 19 39 1 20 40 
		1 21 41 1 22 42 1 23 43 1 24 
		44 1 25 45 1 26 46 1 27 47 1 
		28 48 1 29 49 1 30 50 1 31 51 
		1 32 52 1 33 53 1 34 54 1 35 
		55 1 36 56 1 37 57 1 38 58 1 
		39 59 1 40 60 1 41 61 1 42 62 
		1 43 63 1 44 64 1 45 65 1 46 
		66 1 47 67 1 48 68 1 49 69 1 
		50 70 1 51 71 1 52 72 1 53 73 
		1 54 74 1 55 75 1 56 76 1 57 
		77 1 58 78 1 59 79 1;
	setAttr -s 60 ".fc[0:59]" -type "polyFaces" 
		f 4 0 81 -21 -81 
		mu 0 4 0 1 22 21 
		f 4 1 82 -22 -82 
		mu 0 4 1 2 23 22 
		f 4 2 83 -23 -83 
		mu 0 4 2 3 24 23 
		f 4 3 84 -24 -84 
		mu 0 4 3 4 25 24 
		f 4 4 85 -25 -85 
		mu 0 4 4 5 26 25 
		f 4 5 86 -26 -86 
		mu 0 4 5 6 27 26 
		f 4 6 87 -27 -87 
		mu 0 4 6 7 28 27 
		f 4 7 88 -28 -88 
		mu 0 4 7 8 29 28 
		f 4 8 89 -29 -89 
		mu 0 4 8 9 30 29 
		f 4 9 90 -30 -90 
		mu 0 4 9 10 31 30 
		f 4 10 91 -31 -91 
		mu 0 4 10 11 32 31 
		f 4 11 92 -32 -92 
		mu 0 4 11 12 33 32 
		f 4 12 93 -33 -93 
		mu 0 4 12 13 34 33 
		f 4 13 94 -34 -94 
		mu 0 4 13 14 35 34 
		f 4 14 95 -35 -95 
		mu 0 4 14 15 36 35 
		f 4 15 96 -36 -96 
		mu 0 4 15 16 37 36 
		f 4 16 97 -37 -97 
		mu 0 4 16 17 38 37 
		f 4 17 98 -38 -98 
		mu 0 4 17 18 39 38 
		f 4 18 99 -39 -99 
		mu 0 4 18 19 40 39 
		f 4 19 80 -40 -100 
		mu 0 4 19 20 41 40 
		f 4 20 101 -41 -101 
		mu 0 4 21 22 43 42 
		f 4 21 102 -42 -102 
		mu 0 4 22 23 44 43 
		f 4 22 103 -43 -103 
		mu 0 4 23 24 45 44 
		f 4 23 104 -44 -104 
		mu 0 4 24 25 46 45 
		f 4 24 105 -45 -105 
		mu 0 4 25 26 47 46 
		f 4 25 106 -46 -106 
		mu 0 4 26 27 48 47 
		f 4 26 107 -47 -107 
		mu 0 4 27 28 49 48 
		f 4 27 108 -48 -108 
		mu 0 4 28 29 50 49 
		f 4 28 109 -49 -109 
		mu 0 4 29 30 51 50 
		f 4 29 110 -50 -110 
		mu 0 4 30 31 52 51 
		f 4 30 111 -51 -111 
		mu 0 4 31 32 53 52 
		f 4 31 112 -52 -112 
		mu 0 4 32 33 54 53 
		f 4 32 113 -53 -113 
		mu 0 4 33 34 55 54 
		f 4 33 114 -54 -114 
		mu 0 4 34 35 56 55 
		f 4 34 115 -55 -115 
		mu 0 4 35 36 57 56 
		f 4 35 116 -56 -116 
		mu 0 4 36 37 58 57 
		f 4 36 117 -57 -117 
		mu 0 4 37 38 59 58 
		f 4 37 118 -58 -118 
		mu 0 4 38 39 60 59 
		f 4 38 119 -59 -119 
		mu 0 4 39 40 61 60 
		f 4 39 100 -60 -120 
		mu 0 4 40 41 62 61 
		f 4 40 121 -61 -121 
		mu 0 4 42 43 64 63 
		f 4 41 122 -62 -122 
		mu 0 4 43 44 65 64 
		f 4 42 123 -63 -123 
		mu 0 4 44 45 66 65 
		f 4 43 124 -64 -124 
		mu 0 4 45 46 67 66 
		f 4 44 125 -65 -125 
		mu 0 4 46 47 68 67 
		f 4 45 126 -66 -126 
		mu 0 4 47 48 69 68 
		f 4 46 127 -67 -127 
		mu 0 4 48 49 70 69 
		f 4 47 128 -68 -128 
		mu 0 4 49 50 71 70 
		f 4 48 129 -69 -129 
		mu 0 4 50 51 72 71 
		f 4 49 130 -70 -130 
		mu 0 4 51 52 73 72 
		f 4 50 131 -71 -131 
		mu 0 4 52 53 74 73 
		f 4 51 132 -72 -132 
		mu 0 4 53 54 75 74 
		f 4 52 133 -73 -133 
		mu 0 4 54 55 76 75 
		f 4 53 134 -74 -134 
		mu 0 4 55 56 77 76 
		f 4 54 135 -75 -135 
		mu 0 4 56 57 78 77 
		f 4 55 136 -76 -136 
		mu 0 4 57 58 79 78 
		f 4 56 137 -77 -137 
		mu 0 4 58 59 80 79 
		f 4 57 138 -78 -138 
		mu 0 4 59 60 81 80 
		f 4 58 139 -79 -139 
		mu 0 4 60 61 82 81 
		f 4 59 120 -80 -140 
		mu 0 4 61 62 83 82 ;
	setAttr ".bck" 3;
	setAttr ".vbc" no;
createNode transform -n "pSphere3" -p "Root";
	setAttr ".r" -type "double3" 90 0 0 ;
	setAttr ".s" -type "double3" 1.3311251302529963 1.3311251302529963 1.3311251302529963 ;
createNode mesh -n "pSphereShape3" -p "pSphere3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 84 ".uvst[0].uvsp[0:83]" -type "float2" 0 0.0060058506 
		0.050000001 0.0060058506 0.1 0.0060058506 0.15000001 0.0060058506 0.2 0.0060058506 
		0.25 0.0060058506 0.30000001 0.0060058506 0.35000002 0.0060058506 0.40000004 
		0.0060058506 0.45000005 0.0060058506 0.50000006 0.0060058506 0.55000007 0.0060058506 
		0.60000008 0.0060058506 0.6500001 0.0060058506 0.70000011 0.0060058506 0.75000012 
		0.0060058506 0.80000013 0.0060058506 0.85000014 0.0060058506 0.90000015 0.0060058506 
		0.95000017 0.0060058506 1.0000001 0.0060058506 0 0.35836515 0.050000001 0.35836515 
		0.1 0.35836515 0.15000001 0.35836515 0.2 0.35836515 0.25 0.35836515 0.30000001 
		0.35836515 0.35000002 0.35836515 0.40000004 0.35836515 0.45000005 0.35836515 
		0.50000006 0.35836515 0.55000007 0.35836515 0.60000008 0.35836515 0.6500001 
		0.35836515 0.70000011 0.35836515 0.75000012 0.35836515 0.80000013 0.35836515 
		0.85000014 0.35836515 0.90000015 0.35836515 0.95000017 0.35836515 1.0000001 
		0.35836515 0 0.71072423 0.050000001 0.71072423 0.1 0.71072423 0.15000001 
		0.71072423 0.2 0.71072423 0.25 0.71072423 0.30000001 0.71072423 0.35000002 
		0.71072423 0.40000004 0.71072423 0.45000005 0.71072423 0.50000006 0.71072423 
		0.55000007 0.71072423 0.60000008 0.71072423 0.6500001 0.71072423 0.70000011 
		0.71072423 0.75000012 0.71072423 0.80000013 0.71072423 0.85000014 0.71072423 
		0.90000015 0.71072423 0.95000017 0.71072423 1.0000001 0.71072423 0 1.0630831 
		0.050000001 1.0630831 0.1 1.0630831 0.15000001 1.0630831 0.2 1.0630831 0.25 
		1.0630831 0.30000001 1.0630831 0.35000002 1.0630831 0.40000004 1.0630831 
		0.45000005 1.0630831 0.50000006 1.0630831 0.55000007 1.0630831 0.60000008 
		1.0630831 0.6500001 1.0630831 0.70000011 1.0630831 0.75000012 1.0630831 0.80000013 
		1.0630831 0.85000014 1.0630831 0.90000015 1.0630831 0.95000017 1.0630831 
		1.0000001 1.0630831;
	setAttr ".cuvs" -type "string" "map1";
	setAttr -s 80 ".vt[0:79]"  9.5105696 0 -3.0901716 8.0901737 
		0 -5.8778553 5.8778548 0 -8.0901737 3.0901713 0 -9.5105686 7.0631629e-008 
		0 -10.000004 -3.0901709 0 -9.5105686 -5.8778543 0 -8.0901728 -8.0901728 0 
		-5.8778543 -9.5105677 0 -3.0901709 -10.000002 0 -1.6988008e-007 -9.5105677 
		0 3.0901706 -8.0901718 0 5.8778534 -5.8778534 0 8.0901709 -3.0901704 0 9.5105667 
		9.9248453e-008 0 10.000001 3.0901704 0 9.5105658 5.8778529 0 8.0901709 8.0901709 
		0 5.8778529 9.5105658 0 3.0901699 10 0 0 9.3934784 1.5643437 -3.0521264 7.9905701 
		1.5643437 -5.8054895 5.8054886 1.5643437 -7.9905701 3.0521262 1.5643437 -9.3934784 
		6.9762031e-008 1.5643437 -9.8768873 -3.0521259 1.5643437 -9.3934774 -5.8054881 
		1.5643437 -7.9905691 -7.9905691 1.5643437 -5.8054881 -9.3934774 1.5643437 
		-3.0521259 -9.8768854 1.5643437 -1.6778857e-007 -9.3934774 1.5643437 3.0521255 
		-7.9905686 1.5643437 5.8054876 -5.8054876 1.5643437 7.9905677 -3.0521252 
		1.5643437 9.3934755 9.802654e-008 1.5643437 9.8768845 3.0521252 1.5643437 
		9.3934755 5.8054872 1.5643437 7.9905672 7.9905672 1.5643437 5.8054872 9.3934746 
		1.5643437 3.052125 9.8768835 1.5643437 0 9.0450888 3.0901697 -2.9389277 7.694212 
		3.0901697 -5.5901723 5.5901718 3.0901697 -7.694212 2.9389274 3.0901697 -9.0450878 
		6.7174668e-008 3.0901697 -9.5105686 -2.9389272 3.0901697 -9.0450878 -5.5901713 
		3.0901697 -7.694211 -7.694211 3.0901697 -5.5901713 -9.0450869 3.0901697 -2.9389272 
		-9.5105667 3.0901697 -1.6156555e-007 -9.0450869 3.0901697 2.9389267 -7.6942105 
		3.0901697 5.5901709 -5.5901709 3.0901697 7.6942096 -2.9389265 3.0901697 9.0450859 
		9.4390884e-008 3.0901697 9.5105658 2.9389265 3.0901697 9.045085 5.5901704 
		3.0901697 7.6942091 7.6942091 3.0901697 5.5901704 9.045085 3.0901697 2.9389262 
		9.5105648 3.0901697 0 8.473979 4.5399051 -2.7533629 7.2083969 4.5399051 -5.2372074 
		5.2372065 4.5399051 -7.2083969 2.7533627 4.5399051 -8.473978 6.2933232e-008 
		4.5399051 -8.9100676 -2.7533622 4.5399051 -8.473978 -5.237206 4.5399051 -7.208396 
		-7.208396 4.5399051 -5.237206 -8.4739771 4.5399051 -2.7533622 -8.9100666 
		4.5399051 -1.5136425e-007 -8.4739771 4.5399051 2.7533619 -7.2083955 4.5399051 
		5.2372055 -5.2372055 4.5399051 7.208395 -2.7533617 4.5399051 8.4739761 8.8431008e-008 
		4.5399051 8.9100657 2.7533617 4.5399051 8.4739761 5.237205 4.5399051 7.2083945 
		7.2083945 4.5399051 5.237205 8.4739752 4.5399051 2.7533615 8.9100647 4.5399051 
		0;
	setAttr -s 140 ".ed[0:139]"  0 1 0 1 2 
		0 2 3 0 3 4 0 4 5 0 5 
		6 0 6 7 0 7 8 0 8 9 0 
		9 10 0 10 11 0 11 12 0 12 13 
		0 13 14 0 14 15 0 15 16 0 16 
		17 0 17 18 0 18 19 0 19 0 0 
		20 21 1 21 22 1 22 23 1 23 24 
		1 24 25 1 25 26 1 26 27 1 27 
		28 1 28 29 1 29 30 1 30 31 1 
		31 32 1 32 33 1 33 34 1 34 35 
		1 35 36 1 36 37 1 37 38 1 38 
		39 1 39 20 1 40 41 1 41 42 1 
		42 43 1 43 44 1 44 45 1 45 46 
		1 46 47 1 47 48 1 48 49 1 49 
		50 1 50 51 1 51 52 1 52 53 1 
		53 54 1 54 55 1 55 56 1 56 57 
		1 57 58 1 58 59 1 59 40 1 60 
		61 0 61 62 0 62 63 0 63 64 0 
		64 65 0 65 66 0 66 67 0 67 68 
		0 68 69 0 69 70 0 70 71 0 71 
		72 0 72 73 0 73 74 0 74 75 0 
		75 76 0 76 77 0 77 78 0 78 79 
		0 79 60 0 0 20 1 1 21 1 2 
		22 1 3 23 1 4 24 1 5 25 1 
		6 26 1 7 27 1 8 28 1 9 29 
		1 10 30 1 11 31 1 12 32 1 13 
		33 1 14 34 1 15 35 1 16 36 1 
		17 37 1 18 38 1 19 39 1 20 40 
		1 21 41 1 22 42 1 23 43 1 24 
		44 1 25 45 1 26 46 1 27 47 1 
		28 48 1 29 49 1 30 50 1 31 51 
		1 32 52 1 33 53 1 34 54 1 35 
		55 1 36 56 1 37 57 1 38 58 1 
		39 59 1 40 60 1 41 61 1 42 62 
		1 43 63 1 44 64 1 45 65 1 46 
		66 1 47 67 1 48 68 1 49 69 1 
		50 70 1 51 71 1 52 72 1 53 73 
		1 54 74 1 55 75 1 56 76 1 57 
		77 1 58 78 1 59 79 1;
	setAttr -s 60 ".fc[0:59]" -type "polyFaces" 
		f 4 0 81 -21 -81 
		mu 0 4 0 1 22 21 
		f 4 1 82 -22 -82 
		mu 0 4 1 2 23 22 
		f 4 2 83 -23 -83 
		mu 0 4 2 3 24 23 
		f 4 3 84 -24 -84 
		mu 0 4 3 4 25 24 
		f 4 4 85 -25 -85 
		mu 0 4 4 5 26 25 
		f 4 5 86 -26 -86 
		mu 0 4 5 6 27 26 
		f 4 6 87 -27 -87 
		mu 0 4 6 7 28 27 
		f 4 7 88 -28 -88 
		mu 0 4 7 8 29 28 
		f 4 8 89 -29 -89 
		mu 0 4 8 9 30 29 
		f 4 9 90 -30 -90 
		mu 0 4 9 10 31 30 
		f 4 10 91 -31 -91 
		mu 0 4 10 11 32 31 
		f 4 11 92 -32 -92 
		mu 0 4 11 12 33 32 
		f 4 12 93 -33 -93 
		mu 0 4 12 13 34 33 
		f 4 13 94 -34 -94 
		mu 0 4 13 14 35 34 
		f 4 14 95 -35 -95 
		mu 0 4 14 15 36 35 
		f 4 15 96 -36 -96 
		mu 0 4 15 16 37 36 
		f 4 16 97 -37 -97 
		mu 0 4 16 17 38 37 
		f 4 17 98 -38 -98 
		mu 0 4 17 18 39 38 
		f 4 18 99 -39 -99 
		mu 0 4 18 19 40 39 
		f 4 19 80 -40 -100 
		mu 0 4 19 20 41 40 
		f 4 20 101 -41 -101 
		mu 0 4 21 22 43 42 
		f 4 21 102 -42 -102 
		mu 0 4 22 23 44 43 
		f 4 22 103 -43 -103 
		mu 0 4 23 24 45 44 
		f 4 23 104 -44 -104 
		mu 0 4 24 25 46 45 
		f 4 24 105 -45 -105 
		mu 0 4 25 26 47 46 
		f 4 25 106 -46 -106 
		mu 0 4 26 27 48 47 
		f 4 26 107 -47 -107 
		mu 0 4 27 28 49 48 
		f 4 27 108 -48 -108 
		mu 0 4 28 29 50 49 
		f 4 28 109 -49 -109 
		mu 0 4 29 30 51 50 
		f 4 29 110 -50 -110 
		mu 0 4 30 31 52 51 
		f 4 30 111 -51 -111 
		mu 0 4 31 32 53 52 
		f 4 31 112 -52 -112 
		mu 0 4 32 33 54 53 
		f 4 32 113 -53 -113 
		mu 0 4 33 34 55 54 
		f 4 33 114 -54 -114 
		mu 0 4 34 35 56 55 
		f 4 34 115 -55 -115 
		mu 0 4 35 36 57 56 
		f 4 35 116 -56 -116 
		mu 0 4 36 37 58 57 
		f 4 36 117 -57 -117 
		mu 0 4 37 38 59 58 
		f 4 37 118 -58 -118 
		mu 0 4 38 39 60 59 
		f 4 38 119 -59 -119 
		mu 0 4 39 40 61 60 
		f 4 39 100 -60 -120 
		mu 0 4 40 41 62 61 
		f 4 40 121 -61 -121 
		mu 0 4 42 43 64 63 
		f 4 41 122 -62 -122 
		mu 0 4 43 44 65 64 
		f 4 42 123 -63 -123 
		mu 0 4 44 45 66 65 
		f 4 43 124 -64 -124 
		mu 0 4 45 46 67 66 
		f 4 44 125 -65 -125 
		mu 0 4 46 47 68 67 
		f 4 45 126 -66 -126 
		mu 0 4 47 48 69 68 
		f 4 46 127 -67 -127 
		mu 0 4 48 49 70 69 
		f 4 47 128 -68 -128 
		mu 0 4 49 50 71 70 
		f 4 48 129 -69 -129 
		mu 0 4 50 51 72 71 
		f 4 49 130 -70 -130 
		mu 0 4 51 52 73 72 
		f 4 50 131 -71 -131 
		mu 0 4 52 53 74 73 
		f 4 51 132 -72 -132 
		mu 0 4 53 54 75 74 
		f 4 52 133 -73 -133 
		mu 0 4 54 55 76 75 
		f 4 53 134 -74 -134 
		mu 0 4 55 56 77 76 
		f 4 54 135 -75 -135 
		mu 0 4 56 57 78 77 
		f 4 55 136 -76 -136 
		mu 0 4 57 58 79 78 
		f 4 56 137 -77 -137 
		mu 0 4 58 59 80 79 
		f 4 57 138 -78 -138 
		mu 0 4 59 60 81 80 
		f 4 58 139 -79 -139 
		mu 0 4 60 61 82 81 
		f 4 59 120 -80 -140 
		mu 0 4 61 62 83 82 ;
	setAttr ".bck" 3;
	setAttr ".vbc" no;
createNode lightLinker -n "lightLinker1";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
createNode renderLayer -s -n "globalRender";
createNode polySphere -n "polySphere1";
	setAttr ".r" 10;
createNode deleteComponent -n "deleteComponent1";
	setAttr ".dc" -type "componentList" 2 "f[0:179]" "f[360:379]";
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
		+ "                -controlVertices 0\n"
		+ "                -hulls 0\n"
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
		+ "            -controlVertices 0\n"
		+ "            -hulls 0\n"
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
		+ "                -subdivSurfaces 0\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 0\n"
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
		+ "            -subdivSurfaces 0\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 0\n"
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
		+ "                -subdivSurfaces 0\n"
		+ "                -planes 1\n"
		+ "                -lights 1\n"
		+ "                -cameras 1\n"
		+ "                -controlVertices 1\n"
		+ "                -hulls 0\n"
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
		+ "            -subdivSurfaces 0\n"
		+ "            -planes 1\n"
		+ "            -lights 1\n"
		+ "            -cameras 1\n"
		+ "            -controlVertices 1\n"
		+ "            -hulls 0\n"
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
		+ "                -controlVertices 0\n"
		+ "                -hulls 0\n"
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
		+ "            -controlVertices 0\n"
		+ "            -hulls 0\n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
		+ "                -transitionFrames 1\n"
		+ "                -currentNode \"joint1\" \n"
		+ "                -dropTargetNode \"Root\" \n"
		+ "                -dropNode \"pSphere3\" \n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
		+ "                -transitionFrames 1\n"
		+ "                -currentNode \"joint1\" \n"
		+ "                -dropTargetNode \"Root\" \n"
		+ "                -dropNode \"pSphere3\" \n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
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
		+ "                -showUnderworld 0\n"
		+ "                -showInvisible 0\n"
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
		+ "\tif ($useSceneConfig) {\n"
		+ "\t\tscriptedPanel -e -to $panelName;\n"
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
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l \\\"Persp View\\\" -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -textureMaxSize 1024\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 0\\n    -hulls 0\\n    -grid 0\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l \\\"Persp View\\\" -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -displayTextures 1\\n    -textureMaxSize 1024\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 0\\n    -hulls 0\\n    -grid 0\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -locators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
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
		"playbackOptions -min 0 -max 150 -animationStartTime 0 -animationEndTime 150;");
createNode phong -n "hw2Shader";
	addAttr -ci true -sn "hw2ScriptName" -ln "hw2ScriptName" -dt "string";
	addAttr -ci true -sn "hw2ParamList" -ln "hw2ParamList" -dt "string";
	setAttr ".hw2ScriptName" -type "string" "/Shaders/fx.st";
	setAttr ".hw2ParamList" -type "string" "Texture $diffuse \n";
createNode shadingEngine -n "hw2ShaderSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" (
		"C:/Projects/HW2/Homeworld2/data/ART/FX/PlanetKiller_explosions/abomb.tga");
createNode place2dTexture -n "place2dTexture1";
createNode polyTweakUV -n "polyTweakUV1";
	setAttr ".uopa" yes;
	setAttr -s 211 ".uvtk[0:210]" -type "float2" -0.49785414 -0.49727198 
		-0.44806874 -0.49727198 -0.3982833 -0.49727198 -0.34849787 -0.49727198 -0.29871249 
		-0.49727198 -0.24892709 -0.49727198 -0.19914167 -0.49727198 -0.14935625 -0.49727198 
		-0.099570841 -0.49727198 -0.049785435 -0.49727198 0 -0.49727198 0.049785435 
		-0.49727198 0.09957087 -0.49727198 0.14935631 -0.49727198 0.19914168 -0.49727198 
		0.24892712 -0.49727198 0.29871243 -0.49727198 0.34849799 -0.49727198 0.3982833 
		-0.49727198 0.44806874 -0.49727198 0.49785411 -0.49727198 -0.49785414 -0.44764653 
		-0.44806874 -0.44764653 -0.3982833 -0.44764653 -0.34849787 -0.44764653 -0.29871249 
		-0.44764653 -0.24892709 -0.44764653 -0.19914167 -0.44764653 -0.14935625 -0.44764653 
		-0.099570841 -0.44764653 -0.049785435 -0.44764653 0 -0.44764653 0.049785435 
		-0.44764653 0.09957087 -0.44764653 0.14935631 -0.44764653 0.19914168 -0.44764653 
		0.24892712 -0.44764653 0.29871243 -0.44764653 0.34849799 -0.44764653 0.3982833 
		-0.44764653 0.44806874 -0.44764653 0.49785411 -0.44764653 -0.49785414 -0.39802104 
		-0.44806874 -0.39802104 -0.3982833 -0.39802104 -0.34849787 -0.39802104 -0.29871249 
		-0.39802104 -0.24892709 -0.39802104 -0.19914167 -0.39802104 -0.14935625 -0.39802104 
		-0.099570841 -0.39802104 -0.049785435 -0.39802104 0 -0.39802104 0.049785435 
		-0.39802104 0.09957087 -0.39802104 0.14935631 -0.39802104 0.19914168 -0.39802104 
		0.24892712 -0.39802104 0.29871243 -0.39802104 0.34849799 -0.39802104 0.3982833 
		-0.39802104 0.44806874 -0.39802104 0.49785411 -0.39802104 -0.49785414 -0.34839559 
		-0.44806874 -0.34839559 -0.3982833 -0.34839559 -0.34849787 -0.34839559 -0.29871249 
		-0.34839559 -0.24892709 -0.34839559 -0.19914167 -0.34839559 -0.14935625 -0.34839559 
		-0.099570841 -0.34839559 -0.049785435 -0.34839559 0 -0.34839559 0.049785435 
		-0.34839559 0.09957087 -0.34839559 0.14935631 -0.34839559 0.19914168 -0.34839559 
		0.24892712 -0.34839559 0.29871243 -0.34839559 0.34849799 -0.34839559 0.3982833 
		-0.34839559 0.44806874 -0.34839559 0.49785411 -0.34839559 -0.49785414 -0.29877025 
		-0.44806874 -0.29877025 -0.3982833 -0.29877025 -0.34849787 -0.29877025 -0.29871249 
		-0.29877025 -0.24892709 -0.29877025 -0.19914167 -0.29877025 -0.14935625 -0.29877025 
		-0.099570841 -0.29877025 -0.049785435 -0.29877025 0 -0.29877025 0.049785435 
		-0.29877025 0.09957087 -0.29877025 0.14935631 -0.29877025 0.19914168 -0.29877025 
		0.24892712 -0.29877025 0.29871243 -0.29877025 0.34849799 -0.29877025 0.3982833 
		-0.29877025 0.44806874 -0.29877025 0.49785411 -0.29877025 -0.49785414 -0.24914488 
		-0.44806874 -0.24914488 -0.3982833 -0.24914488 -0.34849787 -0.24914488 -0.29871249 
		-0.24914488 -0.24892709 -0.24914488 -0.19914167 -0.24914488 -0.14935625 -0.24914488 
		-0.099570841 -0.24914488 -0.049785435 -0.24914488 0 -0.24914488 0.049785435 
		-0.24914488 0.09957087 -0.24914488 0.14935631 -0.24914488 0.19914168 -0.24914488 
		0.24892712 -0.24914488 0.29871243 -0.24914488 0.34849799 -0.24914488 0.3982833 
		-0.24914488 0.44806874 -0.24914488 0.49785411 -0.24914488 -0.49785414 -0.19951943 
		-0.44806874 -0.19951943 -0.3982833 -0.19951943 -0.34849787 -0.19951943 -0.29871249 
		-0.19951943 -0.24892709 -0.19951943 -0.19914167 -0.19951943 -0.14935625 -0.19951943 
		-0.099570841 -0.19951943 -0.049785435 -0.19951943 0 -0.19951943 0.049785435 
		-0.19951943 0.09957087 -0.19951943 0.14935631 -0.19951943 0.19914168 -0.19951943 
		0.24892712 -0.19951943 0.29871243 -0.19951943 0.34849799 -0.19951943 0.3982833 
		-0.19951943 0.44806874 -0.19951943 0.49785411 -0.19951943 -0.49785414 -0.14989401 
		-0.44806874 -0.14989401 -0.3982833 -0.14989401 -0.34849787 -0.14989401 -0.29871249 
		-0.14989401 -0.24892709 -0.14989401 -0.19914167 -0.14989401 -0.14935625 -0.14989401 
		-0.099570841 -0.14989401 -0.049785435 -0.14989401 0 -0.14989401 0.049785435 
		-0.14989401 0.09957087 -0.14989401 0.14935631 -0.14989401 0.19914168 -0.14989401 
		0.24892712 -0.14989401 0.29871243 -0.14989401 0.34849799 -0.14989401 0.3982833 
		-0.14989401 0.44806874 -0.14989401 0.49785411 -0.14989401 -0.49785414 -0.10026865 
		-0.44806874 -0.10026865 -0.3982833 -0.10026865 -0.34849787 -0.10026865 -0.29871249 
		-0.10026865 -0.24892709 -0.10026865 -0.19914167 -0.10026865 -0.14935625 -0.10026865 
		-0.099570841 -0.10026865 -0.049785435 -0.10026865 0 -0.10026865 0.049785435 
		-0.10026865 0.09957087 -0.10026865 0.14935631 -0.10026865 0.19914168 -0.10026865 
		0.24892712 -0.10026865 0.29871243 -0.10026865 0.34849799 -0.10026865 0.3982833 
		-0.10026865 0.44806874 -0.10026865 0.49785411 -0.10026865 -0.49785414 -0.050643131 
		-0.44806874 -0.050643131 -0.3982833 -0.050643131 -0.34849787 -0.050643131 
		-0.29871249 -0.050643131 -0.24892709 -0.050643131 -0.19914167 -0.050643131 
		-0.14935625 -0.050643131 -0.099570841 -0.050643131 -0.049785435 -0.050643131 
		0 -0.050643131 0.049785435 -0.050643131 0.09957087 -0.050643131 0.14935631 
		-0.050643131 0.19914168 -0.050643131 0.24892712 -0.050643131 0.29871243 -0.050643131 
		0.34849799 -0.050643131 0.3982833 -0.050643131 0.44806874 -0.050643131 0.49785411 
		-0.050643131 -5.9604645e-008 -0.0010178536;
createNode phong -n "hw2Shader1";
	addAttr -ci true -sn "hw2ScriptName" -ln "hw2ScriptName" -dt "string";
	addAttr -ci true -sn "hw2ParamList" -ln "hw2ParamList" -dt "string";
	setAttr ".hw2ScriptName" -type "string" "/Shaders/fx.st";
	setAttr ".hw2ParamList" -type "string" "Texture $diffuse \n";
createNode shadingEngine -n "hw2Shader1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode file -n "file2";
	setAttr ".ftn" -type "string" (
		"C:/Projects/HW2/Homeworld2/data/ART/FX/PlanetKiller_explosions/abomb02.tga");
createNode place2dTexture -n "place2dTexture2";
createNode phong -n "hw2Shader2";
	addAttr -ci true -sn "hw2ScriptName" -ln "hw2ScriptName" -dt "string";
	addAttr -ci true -sn "hw2ParamList" -ln "hw2ParamList" -dt "string";
	setAttr ".hw2ScriptName" -type "string" "/Shaders/fx.st";
	setAttr ".hw2ParamList" -type "string" "Texture $diffuse \n";
createNode shadingEngine -n "hw2Shader2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode file -n "file3";
	setAttr ".ftn" -type "string" (
		"C:/Projects/HW2/Homeworld2/data/ART/FX/PlanetKiller_explosions/abomb03.tga");
createNode place2dTexture -n "place2dTexture3";
select -ne :time1;
	setAttr ".o" 0;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 3 ".u";
select -ne :lightList1;
select -ne :defaultTextureList1;
	setAttr -s 3 ".tx";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :hyperGraphLayout;
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".img" -type "string" "";
	setAttr ".ims" 1;
select -ne :ikSystem;
connectAttr "polyTweakUV1.out" "pSphereShape1.i";
connectAttr "polyTweakUV1.uvtk[0]" "pSphereShape1.uvst[0].uvtw";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr "hw2ShaderSG.msg" "lightLinker1.lnk[2].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[3].llnk";
connectAttr "hw2Shader1SG.msg" "lightLinker1.lnk[3].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[4].llnk";
connectAttr "hw2Shader2SG.msg" "lightLinker1.lnk[4].olnk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "polySphere1.out" "deleteComponent1.ig";
connectAttr "file1.oc" "hw2Shader.c";
connectAttr "hw2Shader.oc" "hw2ShaderSG.ss";
connectAttr "pSphereShape1.iog" "hw2ShaderSG.dsm" -na;
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
connectAttr "deleteComponent1.og" "polyTweakUV1.ip";
connectAttr "file2.oc" "hw2Shader1.c";
connectAttr "hw2Shader1.oc" "hw2Shader1SG.ss";
connectAttr "pSphereShape2.iog" "hw2Shader1SG.dsm" -na;
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
connectAttr "file3.oc" "hw2Shader2.c";
connectAttr "hw2Shader2.oc" "hw2Shader2SG.ss";
connectAttr "pSphereShape3.iog" "hw2Shader2SG.dsm" -na;
connectAttr "hw2Shader2SG.msg" "materialInfo3.sg";
connectAttr "place2dTexture3.c" "file3.c";
connectAttr "place2dTexture3.tf" "file3.tf";
connectAttr "place2dTexture3.rf" "file3.rf";
connectAttr "place2dTexture3.m" "file3.m";
connectAttr "place2dTexture3.s" "file3.s";
connectAttr "place2dTexture3.wu" "file3.wu";
connectAttr "place2dTexture3.wv" "file3.wv";
connectAttr "place2dTexture3.re" "file3.re";
connectAttr "place2dTexture3.of" "file3.of";
connectAttr "place2dTexture3.r" "file3.ro";
connectAttr "place2dTexture3.o" "file3.uv";
connectAttr "place2dTexture3.ofs" "file3.fs";
connectAttr "hw2ShaderSG.pa" ":renderPartition.st" -na;
connectAttr "hw2Shader1SG.pa" ":renderPartition.st" -na;
connectAttr "hw2Shader2SG.pa" ":renderPartition.st" -na;
connectAttr "hw2Shader.msg" ":defaultShaderList1.s" -na;
connectAttr "hw2Shader1.msg" ":defaultShaderList1.s" -na;
connectAttr "hw2Shader2.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
// End of abomb mesh.ma
