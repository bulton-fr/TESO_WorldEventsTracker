DragonTracker.Events = {}

--[[
-- Called when the addon is loaded
--
-- @param number eventCode
-- @param string addonName name of the loaded addon
--]]
function DragonTracker.Events.onLoaded(eventCode, addOnName)
    -- The event fires each time *any* addon loads - but we only care about when our own addon loads.
    if addOnName == DragonTracker.name then
        DragonTracker:Initialise()
    end
end

--[[
-- Called when the user's interface loads and their character is activated after logging in or performing a reload of the UI.
-- This happens after <EVENT_ADD_ON_LOADED>, so the UI and all addons should be initialised already.
--
-- @param integer eventCode
-- @param boolean initial : true if the user just logged on, false with a UI reload (for example)
--]]
function DragonTracker.Events.onLoadScreen(eventCode, initial)
    if DragonTracker.ready == false then
        return
    end

    DragonTracker.Zone:updateInfo()
    DragonTracker.DragonList:update()
    DragonTracker.GUITimer:changeStatus(DragonTracker.Zone.onDragonMap)
    DragonTracker.GUI:display(DragonTracker.Zone.onDragonMap)
    DragonTracker.DragonStatus:checkAllDragon()
end

--[[
-- Called when a World Event is finished (aka dragon killed).
--
-- @param number eventCode
-- @param number worldEventInstanceId The concerned world event (aka dragon).
--]]
function DragonTracker.Events.onWEDeactivate(eventCode, worldEventInstanceId)
    if DragonTracker.ready == false then
        return
    end

    if DragonTracker.Zone.onDragonMap == false then
        return
    end

    local dragon = DragonTracker.DragonList:obtainForWEInstanceId(worldEventInstanceId)
    dragon:changeStatus(DragonTracker.DragonStatus.list.killed)
end

--[[
-- Called when a World Event has this map pin changed (aka new dragon or dragon in fight).
--
-- @param number eventCode
-- @param number worldEventInstanceId The concerned world event (aka dragon).
-- string unitTag
-- number MapDisplayPinType oldPinType
-- number MapDisplayPinType newPinType
--]]
function DragonTracker.Events.onWEUnitPin(eventCode, worldEventInstanceId, unitTag, oldPinType, newPinType)
    if DragonTracker.ready == false then
        return
    end

    if DragonTracker.Zone.onDragonMap == false then
        return
    end

    local dragon = DragonTracker.DragonList:obtainForWEInstanceId(worldEventInstanceId)
    local status = DragonTracker.DragonStatus:convertMapPin(newPinType)

    dragon:changeStatus(status, unitTag, newPinType)
end

--[[
-- Called when GUI items has been moved by user
--]]
function DragonTracker.Events.onGuiMoveStop()
    if DragonTracker.ready == false then
        return
    end

    DragonTracker.GUI:savePosition()
end

--[[
-- Called when something change in GUI (like open inventory).
-- Used to some debug, the add to event is commented.
--]]
function DragonTracker.Events.onGuiChanged(eventCode)
    if DragonTracker.ready == false then
        return
    end
end