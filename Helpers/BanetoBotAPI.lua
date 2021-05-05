function LoadBanetoBotAPI()
	ObjectTypes = {
		Object = bntapi.GetObjectTypeFlagsTable().Object,
		Item = bntapi.GetObjectTypeFlagsTable().Item,
		Container = bntapi.GetObjectTypeFlagsTable().Container,
		AzeriteEmpoweredItem = bntapi.GetObjectTypeFlagsTable().AzeriteEmpoweredItem,
		AzeriteItem = bntapi.GetObjectTypeFlagsTable().AzeriteItem,
		Unit = bntapi.GetObjectTypeFlagsTable().Unit,
		Player = bntapi.GetObjectTypeFlagsTable().Player,
		ActivePlayer = bntapi.GetObjectTypeFlagsTable().ActivePlayer,
		GameObject = bntapi.GetObjectTypeFlagsTable().GameObject,
		DynamicObject = bntapi.GetObjectTypeFlagsTable().DynamicObject,
		Corpse = bntapi.GetObjectTypeFlagsTable().Corpse,
		AreaTrigger = bntapi.GetObjectTypeFlagsTable().AreaTrigger,
		SceneObject = bntapi.GetObjectTypeFlagsTable().SceneObject,
		ConversationData = bntapi.GetObjectTypeFlagsTable().Conversation
	}
	MovementFlags = {
		Forward = bntapi.GetUnitMovementFlagsTable().Forward,
		Backward = bntapi.GetUnitMovementFlagsTable().Backward,
		StrafeLeft = bntapi.GetUnitMovementFlagsTable().StrafeLeft,
		StrafeRight = bntapi.GetUnitMovementFlagsTable().StrafeRight,
		TurnLeft = bntapi.GetUnitMovementFlagsTable().TurnLeft,
		TurnRight = bntapi.GetUnitMovementFlagsTable().TurnRight,
		PitchUp = bntapi.GetUnitMovementFlagsTable().PitchUp,
		PitchDown = bntapi.GetUnitMovementFlagsTable().PitchDown,
		Walking = bntapi.GetUnitMovementFlagsTable().Walking,
		Immobilized = bntapi.GetUnitMovementFlagsTable().Immobilized,
		Falling = bntapi.GetUnitMovementFlagsTable().Falling,
		FallingFar = bntapi.GetUnitMovementFlagsTable().FallingFar,
		Swimming = bntapi.GetUnitMovementFlagsTable().Swimming,
		Ascending = bntapi.GetUnitMovementFlagsTable().Ascending,
		Descending = bntapi.GetUnitMovementFlagsTable().Descending,
		CanFly = bntapi.GetUnitMovementFlagsTable().CanFly,
		Flying = bntapi.GetUnitMovementFlagsTable().Flying,
	}
	Types = {
		Bool = bntapi.GetValueTypesTable().Bool,
		Char = bntapi.GetValueTypesTable().Char,
		Byte = bntapi.GetValueTypesTable().Byte,
		Short = bntapi.GetValueTypesTable().Short,
		UShort = bntapi.GetValueTypesTable().UShort,
		Int = bntapi.GetValueTypesTable().Int,
		UInt = bntapi.GetValueTypesTable().UInt,
		Long = bntapi.GetValueTypesTable().Long,
		ULong = bntapi.GetValueTypesTable().ULong,
		Float = bntapi.GetValueTypesTable().Float,
		Double = bntapi.GetValueTypesTable().Double,
		String = bntapi.GetValueTypesTable().String,
		GUID = bntapi.GetValueTypesTable().GUID,
	}
	HitFlags = {
		M2Collision = 0x1,
		M2Render = 0x2,
		WMOCollision = 0x10,
		WMORender = 0x20,
		Terrain = 0x100,
		WaterWalkableLiquid = 0x10000,
		Liquid = 0x20000,
		EntityCollision = 0x100000,
		EntityRender = 0x200000,
		LineOfSight = 0x100111,
		Cull = 0x80000,
		SpellLoS = 0x100010
	}
	Offsets = {
		["cgunitdata__animtier"] = "CGUnitData__animTier",
		["cgunitdata__boundingradius"] = "CGUnitData__boundingRadius",
		["cgunitdata__combatreach"] = "CGUnitData__combatReach",
		["cgunitdata__flags"] = "CGUnitData__flags",
		["cgunitdata__target"] = "CGUnitData__target",
		["cgplayerdata__currentspecid"] = "CGPlayerData__currentSpecID",
		["cgunitdata__createdby"] = "CGUnitData__createdBy",
		["cgareatriggerdata__m_spelid"] = "CGAreaTriggerData__m_spellID",
		["cgobjectdata__m_guid"] = "CGObjectData__m_guid",
		["cggameobjectData__m_createdby"] = "CGGameObjectData__m_createdBy",
		["cgunitdata__flags3"] = "CGUnitData__flags3",
		["cgunitdata__flags2"] = "CGUnitData__flags2",
		["cgunitdata__mountdisplayid"] = "CGUnitData__mountDisplayID",
		["cgunitdata__summonedby"] = "CGUnitData__summonedBy",
		["cgunitdata__demoncreator"] = "CGUnitData__demonCreator",
		["cgobjectdata__m_scale"] = "CGObjectData__m_scale",
		["cgobjectdata__m_dynamicflags"] = "CGObjectData__m_dynamicFlags",
		["cgareatriggerdata__m_caster"] = "CGAreaTriggerData__m_caster",
		["cggameobjectdata__flags"] = "CGGameObjectData__Flags",
		["cgunitdata__npcflags"]="CGUnitData__npcFlags"
	}
	StopFalling = bntapi.StopFalling
	ObjectTypeFlags = bntapi.ObjectTypeFlags
	GetObjectWithPointer = bntapi.GetObject
	ObjectExists = bntapi.ObjectExists
	ObjectIsVisible = UnitIsVisible
	ObjectPosition = function(obj)
        local x, y, z = bntapi.ObjectPosition(obj)
        if x then
            return x, y, z
        else
            return 0, 0, 0
        end
    end
	ObjectFacing = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.ObjectFacing(obj)
        else
            return 0
        end
    end
	ObjectName = function(obj)
        if ObjectExists(obj) then
            return UnitName(obj)
        else
            return "Unknown"
        end
    end
	ObjectID = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.ObjectId(obj)
        else
            return 0
        end
    end
	ObjectIsUnit = function(obj)
        return UnitIsVisible(obj) and bntapi.ObjectIsType(obj, bntapi.GetObjectTypeFlagsTable().Unit)
    end
	ObjectIsPlayer = function(obj) 
		return obj and ObjectIsType(obj,ObjectTypes.Player) 
	end
	ObjectIsGameObject = function(obj) 
		return obj and ObjectIsType(obj,ObjectTypes.GameObject) 
	end
	ObjectIsAreaTrigger = function(obj) 
		return obj and ObjectIsType(obj,ObjectTypes.AreaTrigger) 
	end
	GetDistanceBetweenPositions = function(...)
        return (... and bntapi.GetDistanceBetweenPositions(...)) or 0
    end
	GetDistanceBetweenObjects = function(obj1, obj2)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return bntapi.GetDistanceBetweenObjects(obj1, obj2)
        else
            return 0
        end
    end
	GetPositionBetweenObjects = function(obj1, obj2, dist)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return bntapi.GetPositionBetweenObjects(obj1, obj2, dist)
        else
            return 0, 0, 0
        end
    end
	GetPositionFromPosition = function(...)
        return (... and bntapi.GetPositionFromPosition(...)) or 0, 0, 0
    end
	GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) 
		return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi 
	end
	GetPositionBetweenPositions = bntapi.GetPositionBetweenPositions
	ObjectIsFacing = function(obj1, obj2, toler)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return (toler and bntapi.ObjectIsFacing(obj1, obj2, toler)) or (not toler and bntapi.ObjectIsFacing(obj1, obj2))
        end
    end
	RawFacing = bntapi.RawFacing
	ObjectInteract = InteractUnit
	GetObjectCount = bntapi.GetObjectCount
	GetNewObjects = function()
        local added, removed = {}, {}
        added, removed = select(3, bntapi.GetObjectCount()), select(4, bntapi.GetObjectCount())
        return added, removed
    end
	GetNpcCount = bntapi.GetNpcCount
    GetPlayerCount = bntapi.GetPlayerCount
	GetObjectWithIndex = bntapi.GetObjectWithIndex
	GetNpcWithIndex = bntapi.GetNpcWithIndex
	GetPlayerWithIndex = bntapi.GetPlayerWithIndex
	GetObjectWithGUID = function(GUID)
        if GUID and #GUID > 1 then
            return bntapi.GetObjectWithGUID(GUID)
        else
            return ""
        end
    end
	UnitBoundingRadius = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.UnitBoundingRadius(obj)
        else
            return 0
        end
    end
	UnitCombatReach = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.UnitCombatReach(obj)
        else
            return 0
        end
    end
	UnitTarget = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.UnitTarget(obj)
        else
            return ""
        end
    end
	UnitCastID = function(obj)
        if UnitIsVisible(obj) then
            local spellId, target = bntapi.UnitCasting(obj)
            return spellId or 0, spellId or 0, target or "", target or ""
        else
            return 0, 0, "", ""
        end
    end
	UnitCreator = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.UnitCreator(obj)
        else
            return ""
        end
    end
	TraceLine = bntapi.TraceLine
	GetCameraPosition = bntapi.GetCameraPosition
	CancelPendingSpell = bntapi.CancelPendingSpell
	ClickPosition = bntapi.ClickPosition
	IsAoEPending = bntapi.IsAoEPending
	GetTargetingSpell = function() 
		return 
	end
	WorldToScreen = function(...)
        local scale, x, y = UIParent:GetEffectiveScale(), select(2, bntapi.WorldToScreen(...))
        local sx = GetScreenWidth() * scale
        local sy = GetScreenHeight() * scale
        return x * sx, y * sy
    end
	WorldToScreenRaw = function(...)
        local x, y = select(2, bntapi.WorldToScreen(...))
        return x, 1 - y
    end
	ScreenToWorld = function(X, Y)
        local scale = UIParent:GetEffectiveScale()
        local sx = GetScreenWidth() * scale
        local sy = GetScreenHeight() * scale
        return bntapi.ScreenToWorld(X / sx, Y / sy)
    end
	GetMousePosition = function()
        local cur_x, cur_y = GetCursorPosition()
        return cur_x, cur_y
    end
	GetDirectoryFiles = bntapi.GetDirectoryFiles
	ReadFile = bntapi.ReadFile
	WriteFile = bntapi.WriteFile
	CreateDirectory = bntapi.CreateDirectory
	GetSubdirectories = bntapi.GetDirectoryFolders
	GetWoWDirectory = bntapi.GetWoWDirectory
	GetHackDirectory = bntapi.GetAppDirectory
	AddEventCallback = function(Event, Callback)
		if not MiniBotFrames then
			MiniBotFrames = CreateFrame("Frame")
			MiniBotFrames:SetScript("OnEvent",MiniBotFrames_OnEvent)
		end
		MiniBotFrames:RegisterEvent(Event)
	end
	AddFrameCallback = function(frame)
		if not MiniBotFrames then
			MiniBotFrames = CreateFrame("Frame")
		end
		MiniBotFrames:SetScript("OnUpdate",frame)
	end
	SendHTTPRequest = bntapi.SendHttpRequest
	GetKeyState = bntapi.GetKeyState
	GetWoWWindow = function()
		return GetScreenWidth(), GetScreenHeight()
	end
	StopMoving = function()
		MoveAndSteerStop()
		MoveForwardStop()
		MoveBackwardStop()
		PitchDownStop()
		PitchUpStop()
		StrafeLeftStop()
		StrafeRightStop()
		TurnLeftStop()
		TurnOrActionStop()
		TurnRightStop()
		if IsMoving() then
			MoveForwardStart()
			MoveForwardStop()
		end
		if GetKeyState(0x02) then 
			TurnOrActionStart()
		elseif GetKeyState(0x01) then
			CameraOrSelectOrMoveStart()
		end
	end
	IsMeshLoaded = bntapi.IsMapLoaded
	CalculatePath = bntapi.FindPath
	SetMaximumClimbAngle = bntapi.SetClimbAngle
	GetMapId = bntapi.GetCurrentMapInfo
	ObjectGUID = UnitGUID
	ObjectEntryID = UnitGUID
	ObjectIsType = bntapi.ObjectIsType
	GetAnglesBetweenObjects = function(obj1, obj2)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return bntapi.GetAnglesBetweenObjects(obj1, obj2)
        else
            return 0, 0
        end
    end
	FaceDirection = function(a)
        if bntapi.GetObject(a) then
            bntapi.FaceDirection(GetAnglesBetweenObjects(a, "player"), true)
        else
            bntapi.FaceDirection(a, true)
        end
    end
	ObjectIsBehind = bntapi.ObjectIsBehind
	ObjectDescriptor = function(obj, offset, type)
        return UnitIsVisible(obj) and bntapi.ObjectDescriptor(obj, offset, type)
    end
	ObjectTypeFlags = bntapi.ObjectTypeFlags
	ObjectField = bntapi.ObjectField
	GetActivePlayer = function() return "player" end
	UnitIsFacing = function(unit1,unit2,degree) 
		return ObjectIsFacing(unit1,unit2,math.rad(degree)/2) 
	end
	UnitIsFalling = function(unit) 
		return unit and UnitMovementFlags(unit) == bntapi.GetUnitMovementFlagsTable().Falling 
	end
	UnitMovementFlags = bntapi.UnitMovementFlags
	UnitBoundingRadius = bntapi.UnitBoundingRadius
	UnitCombatReach = bntapi.UnitCombatReach
	UnitFlags = bntapi.UnitFlags
	PlayerFlags = function() 
		bntapi.UnitFlags("player") 
	end
	ObjectCreator = bntapi.UnitCreator
	UnitCanBeLooted = bntapi.UnitIsLootable
	UnitCanBeSkinned = bntapi.UnitIsSkinnable
	UnitPitch = bntapi.UnitPitch
	GetGroundZ = function(StartX, StartY, Flags) 
		return TraceLine(StartX, StartY, 10000, StartX, StartY, -10000, Flags or 0x10) 
	end
	GetCorpsePosition = bntapi.GetCorpsePosition
	MoveTo = bntapi.MoveTo
	ObjectDynamicFlags = bntapi.ObjectDynamicFlags
	GetUnitTransport = bntapi.UnitTransport
	GetUnitMovement = bntapi.UnitMovementField
	WebsocketClose = bntapi.CloseWebsocket
	WebsocketSend = bntapi.SendWebsocketData
	ObjectPointer = function(obj)
        if UnitIsVisible(obj) then
            return bntapi.GetObject(obj)
        else
            return ""
        end
    end
	UnitCreatureTypeID = bntapi.UnitCreatureTypeId
	AesEncrypt = bntapi.AesEncrypt
	AesDecrypt = bntapi.AesDecrypt
	ObjectRawType = function(obj)
		local result = 0
		local type_flags = ObjectTypeFlags(obj)
		if (band(type_flags, ObjectTypes.ActivePlayer) > 0) then
			result = 7
		elseif (band(type_flags, ObjectTypes.Player) > 0) then
			result = 6
		elseif (band(type_flags, ObjectTypes.Unit) > 0) then
			result = 5
		elseif (band(type_flags, ObjectTypes.GameObject) > 0) then
			result = 8
		elseif (band(type_flags, ObjectTypes.AreaTrigger) > 0) then
			result = 11
		elseif (band(type_flags, ObjectTypes.Item) > 0) then
			result = 1
		elseif (band(type_flags, ObjectTypes.Container) > 0) then
			result = 2
		elseif (band(type_flags, ObjectTypes.AzeriteEmpoweredItem) > 0) then
			result = 3
		elseif (band(type_flags, ObjectTypes.AzeriteItem) > 0) then
			result = 4
		elseif (band(type_flags, ObjectTypes.DynamicObject) > 0) then
			result = 9
		elseif (band(type_flags, ObjectTypes.Corpse) > 0) then
			result = 10
		elseif (band(type_flags, ObjectTypes.SceneObject) > 0) then
			result = 12
		elseif (band(type_flags, ObjectTypes.ConversationData) > 0) then
			result = 13
		end
		return result
	end
	GetOffset = function(offset)
		return bntapi.GetObjectDescriptorsTable()[Offsets[string.lower(offset)]]
	end
	IsQuestObject = function(...)
        return bntapi.ObjectIsQuestObjective(...,false)
    end
	InitializeNavigation = function() 
		return 
	end
    IsHackEnabled = function()
        return
    end
    SetHackEnabled = function()
        return true
    end
end
