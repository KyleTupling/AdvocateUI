-- AdvocateComponent file
AdvocateComponent = {}
AdvocateComponent.__index = AdvocateComponent

function AdvocateComponent.new(_posX, _posY)
    local self = {}
    
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

--- Fetches the current position of the component
-- @return number: The position on the screen's x-axis
-- @return number: The position on the screen's y-axis
function AdvocateComponent:GetCurrentPos()
    return self.CurrentPosX, self.CurrentPosY
end