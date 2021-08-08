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
            "gradient" => self.make_gradient,
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
    def make_gradient
        lights = self.lights.select{|light| light.has_valid_color? }
        step = 0
        buff = 100/(lights.length)
        if lights.length == 1
            return {
                "type" => "color",
                "value" => lights[0].to_css_rgb
            }
        end
        rgbs = lights.map do |light|
            step += buff
            light.to_css_rgb + " #{step}%"
        end.join(', ')

        return {
            "type" => "gradient",
            "value" => "linear-gradient( #{rgbs} )"
        }
    end
end