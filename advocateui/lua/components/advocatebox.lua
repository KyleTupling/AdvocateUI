-- AdvocateBox file
AdvocateBox = {}
AdvocateBox.__index = AdvocateBox

function AdvocateBox.new(_posX, _posY, _width, _height, _bgColor)
    local self = {}

    self.Parent = nil

    self.PosX = _posX || 0
    self.PosY = _posY || 0

    self.CurrentPosX = self.PosX
    self.CurrentPosY = self.PosY

    self.AltPosX = nil 
    self.AltPosY = nil

    self.IsDisplayed = true 

    self.Children = {}

    setmetatable(self, AdvocateBox)
    return self
end

