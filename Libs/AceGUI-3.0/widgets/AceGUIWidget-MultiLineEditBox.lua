local function OnCursorChanged(self, _, y, _, cursorHeight)                      -- EditBox
    self, y = self.obj.scrollFrame, -y
    local offset = self:GetVerticalScroll()

    -- Safeguard against recursion
    if self.isAdjustingScroll then return end
    self.isAdjustingScroll = true

    if y < offset then
        self:SetVerticalScroll(y)
    else
        y = y + cursorHeight - self:GetHeight()
        if y > offset then
            self:SetVerticalScroll(y)
        end
    end

    self.isAdjustingScroll = false
end

local function OnVerticalScroll(self, offset)                                    -- ScrollFrame
    local editBox = self.obj.editBox

    -- Safeguard against recursion
    if self.isAdjustingScroll then return end
    self.isAdjustingScroll = true

    editBox:SetHitRectInsets(0, 0, offset, editBox:GetHeight() - offset - self:GetHeight())

    self.isAdjustingScroll = false
end
