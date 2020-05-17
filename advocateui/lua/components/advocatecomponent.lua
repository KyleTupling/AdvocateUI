-- AdvocateComponent file
AdvocateComponent = {}
AdvocateComponent.__index = AdvocateComponent

function AdvocateComponent.new(_posX, _posY)
    local self = {
        PosX = _posX || 0,
        PosY = _posY || 0,
        CurrentPosX = _posX || 0,
        CurrentPosX = _posY || 0,
        AltPosX = nil,
        AltPosY = nil,
        IsDisplayed = true,
        Children = {}
    }

    setmetatable(self, AdvocateComponent)
    return self
end

function AdvocateComponent:GetCurrentPos()
    return self.CurrentPosX, self.CurrentPosY
end