local TextureLoadingGroupMixin = {}

function TextureLoadingGroupMixin:RemoveTexture(texture, key)
    -- Placeholder implementation for compatibility
    if texture and key then
        texture[key] = nil
    end
end

return TextureLoadingGroupMixin