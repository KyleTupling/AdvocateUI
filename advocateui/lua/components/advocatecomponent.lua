-- AdvocateComponent file
AdvocateComponent = {}
AdvocateComponent.new = function(_posX, _posY)
    local self = {}

    -- The targetted position of the component
    self.PosX = _posX
    self.PosY = _posY

    -- The actual current position of the component
    self.CurrentPosX = self.PosX
    self.CurrentPosY = self.PosY

    -- Alternative positions for toggling
    self.AltPosX = nil
    self.AltPosY = nil 

    -- Keeps track of the state of the component
    self.IsDisplayed = true 

    -- Stores any child components
    self.Children = {}

    return self
end