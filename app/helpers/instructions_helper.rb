module InstructionsHelper
    def interpretor(h)
        h = h.to_h["instruction"]
        r = []
        if h.has_key?("room")
            r.push Room.interpretor(h["room"])
        end
        if h.has_key?("light")
            r.push Light.interpretor(h["light"])
        end
        return r
    end
end