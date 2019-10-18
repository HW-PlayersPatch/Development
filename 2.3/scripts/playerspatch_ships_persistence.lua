-- Group management --
-- Use this object to persist memory across script calls.
--
-- This is just a global table of tables with a small api.
-- MemGroups represents an associative array of ship groups.
-- The groups themselves also come with a default set of accessors,
-- which can be extended via custom_attribs when creating the group.
--
-- Accessing the groups themselves is not recommended, but obviously
-- entirely possible.

MemGroup = {
	_groups = {},
	-- _new
	-- 1: group_name: string
	-- 2: custom_attribs: table<any, any>
	--
	-- return: MemGroup
	--
	-- Internal function. Creates a new MemGroup on the _groups
	-- table. MemGroups are tables of Entities. Entities are tables
	-- with the following attributes:
	-- [entity]:
	--   _tick: string
	--   GetTick: function() => number
	--   NextTick: function() => number
	-- In addition, the entity will also host the attributes defined
	-- in custom_attributes.
	_new = function(group_name, custom_attribs)
		return {
			_entities = {},
			_custom_attribs = custom_attribs,
			get = function (entityID)
				return MemGroup._groups[group_name]._entities[entityID]
			end,
			set = function (this, entityID, entity)
				MemGroup._groups[group_name].entites[entityID] = entity
				local e = MemGroup._groups[group_name].entites[entityID]
				if (e._tick == nil) then
					e._tick = 0
				end
				function e:NextTick()
					self._tick = self._tick + 1
					if (self._tick > 128) then
						self._tick = 0
					end
					return self._tick
				end
				function e:GetTick()
					return self._tick
				end
				for i, v in MemGroup._groups[group_name]._custom_attribs do
					e[i] = v
				end
				return e
			end,
			delete = function(entityID)
				MemGroup._groups[group_name]._entites[entityID] = nil
			end
		}
	end,
	-- Create
	-- 1: group_name: string
	-- 2: custom_attribs: table<any: any>
	--
	-- return: MemGroup
	--
	-- 'Soft' creation of group. If the group already exists, the already
	-- present group is returned instead.
	Create = function (group_name, custom_attribs)
		if (MemGroup._groups[group_name] == nil) then
			return MemGroup.ForceCreate(group_name, custom_attribs)
		end
		return MemGroup._groups[group_name]
	end,

	-- ForceCreate
	-- 1: group_name: string
	-- 2: custom_attribs: table<any: any>
	--
	-- return: MemGroup
	--
	-- 'Hard' creation of group. If a group with this name already exists,
	-- it will be silently overwritten. Internally calls NewMemGroup.
	ForceCreate = function (group_name, custom_attribs)
		if custom_attribs == nil then
			custom_attribs = {}
		end
		MemGroup._groups[group_name] = MemGroup._new(group_name, custom_attribs)
		return MemGroup._groups[group_name]
	end,

	-- Get
	-- 1: group_name: string
	--
	-- return: MemGroup
	--
	-- Returns the group indexed by group_name.
	Get = function (group_name)
		return MemGroup._groups[group_name]
	end,

	-- Exists
	-- 1: group_name
	--
	-- return: boolean
	--
	-- Checks the existence of the group indexed by group_name
	Exists = function (group_name)
		return MemGroup._groups[group_name] ~= nil
	end
}
