base_research = nil 
base_research = {

	{ 
		Name =					"UtilityHealthUpgrade1",
		RequiredResearch =		"",                                                    
		RequiredSubSystems =	"Research", 
		RequireTag = 		"VaygrUtility",                                                  
		Cost = 					2100,
		Time = 					180,
		DisplayedName =			"$7779",
		DisplayPriority =		701,                                                   
		Description =			"$7780",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Utility",
		UpgradeName =			"MAXHEALTH",
		UpgradeValue =			2.0,	
		Icon = 				Icon_Health,
		ShortDisplayedName = 		"$7351",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end
base_research = nil 
