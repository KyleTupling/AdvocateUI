-- AdvocateBox file
AdvocateBox = {}
AdvocateBox.__index = AdvocateBox

function AdvocateBox.new(_posX, _posY, _width, _height, _bgColor)
    local self = {}

    self.Parent = nil

    self.PosX = _posX || 0
    self.PosY = _posY || 0

    self.Width = _width
    self.Height = _height

    self.BgColor = _bgColor

    self.CurrentPosX = self.PosX
    self.CurrentPosY = self.PosY

    self.AltPosX = nil 
    self.AltPosY = nil

    self.IsDisplayed = true 

    self.Children = {}

    setmetatable(self, AdvocateBox)
    return self
end

function AdvocateBox:Draw()
    if(self.IsDisplayed) then
        self.CurrentPosX = Lerp(10 * FrameTime(), self.CurrentPosX, self.PosX)
        self.CurrentPosY = Lerp(10 * FrameTime(), self.CurrentPosY, self.PosY)
    else
        if(self.AltPosX) then self.CurrentPosX = Lerp(10 * FrameTime(), self.CurrentPosX, self.AltPosX) end
        if(self.AltPosY) then self.CurrentPosY = Lerp(10 * FrameTime(), self.CurrentPosY, self.AltPosY) end
    end

    -- Base
    draw.RoundedBox(0, self.CurrentPosX, self.CurrentPosY, self.Width, self.Height, self.BgColor)

    for i = 1, #self.Children do
        self.Children[i].Draw()
    end
end