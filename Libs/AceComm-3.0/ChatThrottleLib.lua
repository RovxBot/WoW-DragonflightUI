function ChatThrottleLib.Hook_SendChatMessage(text, chattype, language, destination, ...)
    if bMyTraffic then
        return
    end

    -- Validate arguments
    if not text or type(text) ~= "string" then
        print("ChatThrottleLib: Invalid 'text' argument passed to SendChatMessage.")
        return
    end
    if not chattype or type(chattype) ~= "string" then
        print("ChatThrottleLib: Invalid 'chattype' argument passed to SendChatMessage.")
        return
    end
    if language and type(language) ~= "string" then
        print("ChatThrottleLib: Invalid 'language' argument passed to SendChatMessage.")
        return
    end
    if destination and type(destination) ~= "string" then
        print("ChatThrottleLib: Invalid 'destination' argument passed to SendChatMessage.")
        return
    end

    local self = ChatThrottleLib
    local size = strlen(tostring(text)) + strlen(tostring(destination or "")) + self.MSG_OVERHEAD
    self.avail = self.avail - size
    self.nBypass = self.nBypass + size -- just a statistic
end
