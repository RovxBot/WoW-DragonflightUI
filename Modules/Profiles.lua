-- Apply the DragonflightUIModulesMixin to ensure SetWasEnabled is available
if not self.SetWasEnabled then
    Mixin(self, DragonflightUIModulesMixin)
end

-- Debugging to verify mixin application
if self.SetWasEnabled then
    DF:Debug(self, 'Module ' .. mName .. ' OnEnable()')
    self:SetWasEnabled(true)
else
    DF:Debug(self, 'Failed to apply DragonflightUIModulesMixin to object:', self)
end
