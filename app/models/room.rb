class Room < ApplicationRecord
    has_many :lights
    def turn_off
        self.lights.map do |light|
            light.turn_off
        end
        self.deal_switch
    end
    def turn_on
        self.lights.map do |light|
            light.turn_on
        end
        self.deal_switch
    end
    def deal_switch
        self.update(
            state: self.lights.any?{
                |light| light.state == true
            }
        )
    end
    def render
        return {
            "name" => self.name,
            "state" => self.state,
            "lights" => self.lights.map do |light|
                light.render
            end
        }
    end
    def self.interpretor(h)
        room = Room.where(id: h["id"])[0]
        if h.has_key?("state")
            if h["state"] == true
                room.turn_on
            else
                room.turn_off
            end
        end
        if h.has_key?("theme")
            raise "no"
        end
        return room.render
    end
    def set_color(r, g, b)
        self.lights.map do |light|
            light.set_color(r, g, b)
        end
    end
end
