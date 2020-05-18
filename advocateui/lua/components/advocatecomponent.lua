-- AdvocateComponent file
AdvocateComponent = {}
AdvocateComponent.__index = AdvocateComponent

function AdvocateComponent.new(_posX, _posY)
    assert(type(_posX) == "number", _posX || "nil" .. " is not a number")
    assert(type(_posY) == "number", _posY || "nil" .. " is not a number")

    local self = {}

    -- The component's parent
    self.Parent = nil
    
    -- The target position of the component
    self.PosX = _posX || 0
    self.PosY = _posY || 0

    -- The current position of the component
    -- (this may not always match PosX/PosY due to interpolated movement)
    self.CurrentPosX = self.PosX
    self.CurrentPosX = self.PosY

    -- Alternative positions to allow for toggling of the component
    self.AltPosX = nil
    self.AltPosY = nil

    -- Whether the component is currently displayed
    self.IsDisplayed = true

    -- Stores references to any child objects
    self.Children = {}

    setmetatable(self, AdvocateComponent)
    return self
end

--- Draws the component to the client's screen
-- This method will certainly be overridden but the included algorithms should still be executed to display the component
-- in the correct position
function AdvocateComponent:Draw()
    if(self.IsDisplayed) then
        -- Use linear interpolation to smooth out movement between positions
        self.CurrentPosX = Lerp(10 * FrameTime(), self.CurrentPosX, self.PosX)
        self.CurrentPosY = Lerp(10 * FrameTime(), self.CurrentPosY, self.PosY)
    else
        if(self.AltPosX) then self.CurrentPosX = Lerp(10 * FrameTime(), self.CurrentPosX, self.AltPosX) end
        if(self.AltPosY) then self.CurrentPosY = Lerp(10 * FrameTime(), self.CurrentPosY, self.AltPosY) end
    end
end

--- Toggles the component's display property
-- This will swap the target position between the default position and the alternative position (granted it is defined)
-- @return error (IF FAILED)
function AdvocateComponent:Toggle()
    if(self.AltPosX || self.AltPosY) then
        self.IsDisplayed = !self.IsDisplayed
    else
        return error("To toggle this component you must define either an alternative x-position or an alternative y-position.")
    end
end

--- Fetches the target position of the component
-- @return number: The position on the screen's x-axis
-- @return number: The position on the screen's y-axis
function AdvocateComponent:GetTargetPos()
    return self.PosX, self.PosY
end

--- Fetches the current position of the component
-- @return number: The position on the screen's x-axis
-- @return number: The position on the screen's y-axis
function AdvocateComponent:GetCurrentPos()
    return self.CurrentPosX, self.CurrentPosY
end

--- Sets the alternative position of the component
-- @param _x number: The alternative position on the screen's x-axis
-- @param _y number: The alternative position on the screen's y-axis
function AdvocateComponent:SetAltPos(_x, _y)
    assert(type(_x) == "number", _x || "nil" .. " is not a number")
    assert(type(_y) == "number", _y || "nil" .. " is not a number")
    self.AltPosX = _x
    self.AltPosY = _y
end