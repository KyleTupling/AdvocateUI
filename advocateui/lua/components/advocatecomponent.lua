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