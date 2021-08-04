require 'json'

module RoomsHelper
    def interpretor(h)
        h.to_h
        if h.has_key?("instructions")
            p "instruction"
        end
        p("/////////////////////put\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
        p (h)
        p "***************************************"
    end
end