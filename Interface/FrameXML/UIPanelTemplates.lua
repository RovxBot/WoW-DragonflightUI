function ScrollingEdit_OnUpdate(self, elapsed)
    -- Safeguard against nil cursorOffset
    if not self.cursorOffset then
        self.cursorOffset = 0
    end

    -- Debugging to track cursorOffset
    if self.cursorOffset then
        print("ScrollingEdit_OnUpdate: cursorOffset =", self.cursorOffset)
    end

    -- Original logic
    local scrollFrame = self.scrollFrame
    local range = scrollFrame.range
    local scroll = scrollFrame.scroll
    local size = scrollFrame.size
    local height = scrollFrame.height

    -- Ensure arithmetic is safe
    local offset = self.cursorOffset + range - scroll
    if offset < 0 then
        offset = 0
    elseif offset > size - height then
        offset = size - height
    end

    scrollFrame:SetVerticalScroll(offset)
end