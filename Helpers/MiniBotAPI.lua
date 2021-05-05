function LoadMiniBotAPI()
	ObjectTypes = {
		Object = wmbapi.GetObjectTypeFlagsTable().Object,
		Item = wmbapi.GetObjectTypeFlagsTable().Item,
		Container = wmbapi.GetObjectTypeFlagsTable().Container,
		AzeriteEmpoweredItem = wmbapi.GetObjectTypeFlagsTable().AzeriteEmpoweredItem,
		AzeriteItem = wmbapi.GetObjectTypeFlagsTable().AzeriteItem,
		Unit = wmbapi.GetObjectTypeFlagsTable().Unit,
		Player = wmbapi.GetObjectTypeFlagsTable().Player,
		ActivePlayer = wmbapi.GetObjectTypeFlagsTable().ActivePlayer,
		GameObject = wmbapi.GetObjectTypeFlagsTable().GameObject,
		DynamicObject = wmbapi.GetObjectTypeFlagsTable().DynamicObject,
		Corpse = wmbapi.GetObjectTypeFlagsTable().Corpse,
		AreaTrigger = wmbapi.GetObjectTypeFlagsTable().AreaTrigger,
		SceneObject = wmbapi.GetObjectTypeFlagsTable().SceneObject,
		ConversationData = wmbapi.GetObjectTypeFlagsTable().Conversation
	}
	MovementFlags = {
		Forward = wmbapi.GetUnitMovementFlagsTable().Forward,
		Backward = wmbapi.GetUnitMovementFlagsTable().Backward,
		StrafeLeft = wmbapi.GetUnitMovementFlagsTable().StrafeLeft,
		StrafeRight = wmbapi.GetUnitMovementFlagsTable().StrafeRight,
		TurnLeft = wmbapi.GetUnitMovementFlagsTable().TurnLeft,
		TurnRight = wmbapi.GetUnitMovementFlagsTable().TurnRight,
		PitchUp = wmbapi.GetUnitMovementFlagsTable().PitchUp,
		PitchDown = wmbapi.GetUnitMovementFlagsTable().PitchDown,
		Walking = wmbapi.GetUnitMovementFlagsTable().Walking,
		Immobilized = wmbapi.GetUnitMovementFlagsTable().Immobilized,
		Falling = wmbapi.GetUnitMovementFlagsTable().Falling,
		FallingFar = wmbapi.GetUnitMovementFlagsTable().FallingFar,
		Swimming = wmbapi.GetUnitMovementFlagsTable().Swimming,
		Ascending = wmbapi.GetUnitMovementFlagsTable().Ascending,
		Descending = wmbapi.GetUnitMovementFlagsTable().Descending,
		CanFly = wmbapi.GetUnitMovementFlagsTable().CanFly,
		Flying = wmbapi.GetUnitMovementFlagsTable().Flying,
	}
	Types = {
		Bool = wmbapi.GetValueTypesTable().Bool,
		Char = wmbapi.GetValueTypesTable().Char,
		Byte = wmbapi.GetValueTypesTable().Byte,
		Short = wmbapi.GetValueTypesTable().Short,
		UShort = wmbapi.GetValueTypesTable().UShort,
		Int = wmbapi.GetValueTypesTable().Int,
		UInt = wmbapi.GetValueTypesTable().UInt,
		Long = wmbapi.GetValueTypesTable().Long,
		ULong = wmbapi.GetValueTypesTable().ULong,
		Float = wmbapi.GetValueTypesTable().Float,
		Double = wmbapi.GetValueTypesTable().Double,
		String = wmbapi.GetValueTypesTable().String,
		GUID = wmbapi.GetValueTypesTable().GUID,
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
	StopFalling = wmbapi.StopFalling
	ObjectTypeFlags = wmbapi.ObjectTypeFlags
	GetObjectWithPointer = wmbapi.GetObject
	ObjectExists = wmbapi.ObjectExists
	ObjectIsVisible = UnitIsVisible
	ObjectPosition = function(obj)
        local x, y, z = wmbapi.ObjectPosition(obj)
        if x then
            return x, y, z
        else
            return 0, 0, 0
        end
    end
	ObjectFacing = function(obj)
        if UnitIsVisible(obj) then
            return wmbapi.ObjectFacing(obj)
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
            return wmbapi.ObjectId(obj)
        else
            return 0
        end
    end
	ObjectIsUnit = function(obj)
        return UnitIsVisible(obj) and wmbapi.ObjectIsType(obj, wmbapi.GetObjectTypeFlagsTable().Unit)
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
        return (... and wmbapi.GetDistanceBetweenPositions(...)) or 0
    end
	GetDistanceBetweenObjects = function(obj1, obj2)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return wmbapi.GetDistanceBetweenObjects(obj1, obj2)
        else
            return 0
        end
    end
	GetPositionBetweenObjects = function(obj1, obj2, dist)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return wmbapi.GetPositionBetweenObjects(obj1, obj2, dist)
        else
            return 0, 0, 0
        end
    end
	GetPositionFromPosition = function(...)
        return (... and wmbapi.GetPositionFromPosition(...)) or 0, 0, 0
    end
	GetAnglesBetweenPositions = function(X1, Y1, Z1, X2, Y2, Z2) 
		return math.atan2(Y2 - Y1, X2 - X1) % (math.pi * 2), math.atan((Z1 - Z2) / math.sqrt(math.pow(X1 - X2, 2) + math.pow(Y1 - Y2, 2))) % math.pi 
	end
	GetPositionBetweenPositions = wmbapi.GetPositionBetweenPositions
	ObjectIsFacing = function(obj1, obj2, toler)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return (toler and wmbapi.ObjectIsFacing(obj1, obj2, toler)) or (not toler and wmbapi.ObjectIsFacing(obj1, obj2))
        end
    end
	ObjectInteract = InteractUnit
	GetObjectCount = wmbapi.GetObjectCount
	GetNewObjects = function()
        local added, removed = {}, {}
        added, removed = select(3, wmbapi.GetObjectCount()), select(4, wmbapi.GetObjectCount())
        return added, removed
    end
	GetNpcCount = wmbapi.GetNpcCount
    GetPlayerCount = wmbapi.GetPlayerCount
	GetObjectWithIndex = wmbapi.GetObjectWithIndex
	GetNpcWithIndex = wmbapi.GetNpcWithIndex
	GetPlayerWithIndex = wmbapi.GetPlayerWithIndex
	GetObjectWithGUID = function(GUID)
        if GUID and #GUID > 1 then
            return wmbapi.GetObjectWithGUID(GUID)
        else
            return ""
        end
    end
	UnitBoundingRadius = function(obj)
        if UnitIsVisible(obj) then
            return wmbapi.UnitBoundingRadius(obj)
        else
            return 0
        end
    end
	UnitCombatReach = function(obj)
        if UnitIsVisible(obj) then
            return wmbapi.UnitCombatReach(obj)
        else
            return 0
        end
    end
	UnitTarget = function(obj)
        if UnitIsVisible(obj) then
            return wmbapi.UnitTarget(obj)
        else
            return ""
        end
    end
	UnitCastID = function(obj)
        if UnitIsVisible(obj) then
            local spellId, target = wmbapi.UnitCasting(obj)
            return spellId or 0, spellId or 0, target or "", target or ""
        else
            return 0, 0, "", ""
        end
    end
	UnitCreator = function(obj)
        if UnitIsVisible(obj) then
            return wmbapi.UnitCreator(obj)
        else
            return ""
        end
    end
	TraceLine = wmbapi.TraceLine
	GetCameraPosition = wmbapi.GetCameraPosition
	CancelPendingSpell = wmbapi.CancelPendingSpell
	ClickPosition = wmbapi.ClickPosition
	IsAoEPending = wmbapi.IsAoEPending
	GetTargetingSpell = function() 
		return 
	end
	WorldToScreen = function(...)
        local scale, x, y = UIParent:GetEffectiveScale(), select(2, wmbapi.WorldToScreen(...))
        local sx = GetScreenWidth() * scale
        local sy = GetScreenHeight() * scale
        return x * sx, y * sy
    end
	WorldToScreenRaw = function(...)
        local x, y = select(2, wmbapi.WorldToScreen(...))
        return x, 1 - y
    end
	ScreenToWorld = function(X, Y)
        local scale = UIParent:GetEffectiveScale()
        local sx = GetScreenWidth() * scale
        local sy = GetScreenHeight() * scale
        return wmbapi.ScreenToWorld(X / sx, Y / sy)
    end
	GetMousePosition = function()
        local cur_x, cur_y = GetCursorPosition()
        return cur_x, cur_y
    end
	GetDirectoryFiles = wmbapi.GetDirectoryFiles
	ReadFile = wmbapi.ReadFile
	WriteFile = wmbapi.WriteFile
	CreateDirectory = wmbapi.CreateDirectory
	GetSubdirectories = wmbapi.GetDirectoryFolders
	GetWoWDirectory = wmbapi.GetWoWDirectory
	GetHackDirectory = wmbapi.GetAppDirectory
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
	SendHTTPRequest = wmbapi.SendHttpRequest
	GetKeyState = wmbapi.GetKeyState
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
	IsMeshLoaded = wmbapi.IsMapLoaded
	CalculatePath = wmbapi.FindPath
	SetMaximumClimbAngle = wmbapi.SetClimbAngle
	GetMapId = wmbapi.GetCurrentMapInfo
	ObjectGUID = UnitGUID
	ObjectEntryID = UnitGUID
	ObjectIsType = wmbapi.ObjectIsType
	GetAnglesBetweenObjects = function(obj1, obj2)
        if UnitIsVisible(obj1) and UnitIsVisible(obj2) then
            return wmbapi.GetAnglesBetweenObjects(obj1, obj2)
        else
            return 0, 0
        end
    end
	FaceDirection = function(a)
        if wmbapi.GetObject(a) then
            wmbapi.FaceDirection(GetAnglesBetweenObjects(a, "player"), true)
        else
            wmbapi.FaceDirection(a, true)
        end
    end
	ObjectIsBehind = wmbapi.ObjectIsBehind
	ObjectDescriptor = function(obj, offset, type)
        return UnitIsVisible(obj) and wmbapi.ObjectDescriptor(obj, offset, type)
    end
	ObjectTypeFlags = wmbapi.ObjectTypeFlags
	ObjectField = wmbapi.ObjectField
	GetActivePlayer = function() return "player" end
	UnitIsFacing = function(unit1,unit2,degree) 
		return ObjectIsFacing(unit1,unit2,math.rad(degree)/2) 
	end
	UnitIsFalling = function(unit) 
		return unit and UnitMovementFlags(unit) == wmbapi.GetUnitMovementFlagsTable().Falling 
	end
	UnitMovementFlags = wmbapi.UnitMovementFlags
	UnitBoundingRadius = wmbapi.UnitBoundingRadius
	UnitCombatReach = wmbapi.UnitCombatReach
	UnitFlags = wmbapi.UnitFlags
	PlayerFlags = function() 
		wmbapi.UnitFlags("player") 
	end
	ObjectCreator = wmbapi.UnitCreator
	UnitCanBeLooted = wmbapi.UnitIsLootable
	UnitCanBeSkinned = wmbapi.UnitIsSkinnable
	UnitPitch = wmbapi.UnitPitch
	GetGroundZ = function(StartX, StartY, Flags) 
		return TraceLine(StartX, StartY, 10000, StartX, StartY, -10000, Flags or 0x10) 
	end
	GetCorpsePosition = wmbapi.GetCorpsePosition
	MoveTo = wmbapi.MoveTo
	ObjectDynamicFlags = wmbapi.ObjectDynamicFlags
	GetUnitTransport = wmbapi.UnitTransport
	GetUnitMovement = wmbapi.UnitMovementField
	WebsocketClose = wmbapi.CloseWebsocket
	WebsocketSend = wmbapi.SendWebsocketData
	ObjectPointer = function(obj)
        if UnitIsVisible(obj) then
            return wmbapi.GetObject(obj)
        else
            return ""
        end
    end
	UnitCreatureTypeID = wmbapi.UnitCreatureTypeId
	AesEncrypt = wmbapi.AesEncrypt
	AesDecrypt = wmbapi.AesDecrypt
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
		return wmbapi.GetObjectDescriptorsTable()[Offsets[string.lower(offset)]]
	end
	IsQuestObject = function(...)
        return wmbapi.ObjectIsQuestObjective(...,false)
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
