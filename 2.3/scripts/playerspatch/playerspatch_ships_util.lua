doscanpath("data:scripts/playerspatch/ships_util", "*.lua")

-- global ship registry - ideally, all ships should register themselves here in their Create functions
GLOBAL_SHIPS = MemGroup:Create("MG_GLOBAL_SHIPS", {
	family_type = MemGroup_FAMILY_TYPES.default
})