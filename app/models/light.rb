class Light < ApplicationRecord
    belongs_to :room
    has_many :theme_lights
    def turn_off
        self.update(state: false)
        self.trade_switch
        if self.custom
            #pour les customs
        else
            data = {
                "on" => false
            }
            response = HTTParty.put("http://192.168.1.37/api/e40b-vlXo73fUxwfaS5oex7CLSWRPaFEO92RrprG/lights/#{self.id_ip}/state",  
                         :body => JSON.generate(data)
            )
        end
    end
    def turn_on
        self.update(state: true)
        self.trade_switch
        if self.custom
            #pour les customs
        else
            data = {
                "on" => true
            }
            response = HTTParty.put("http://192.168.1.37/api/e40b-vlXo73fUxwfaS5oex7CLSWRPaFEO92RrprG/lights/#{self.id_ip}/state",  
                         :body => JSON.generate(data)
            )
        end
    end
    def trade_switch
        self.room.deal_switch
    end
    def sendBody(body)
        if !self.custom
            response = HTTParty.put("http://192.168.1.37/api/e40b-vlXo73fUxwfaS5oex7CLSWRPaFEO92RrprG/lights/#{self.id_ip}/state",  
                                 :body => JSON.generate(body))
        else
                
        end
        p r
        p g
        p b
    end
    def set_color(r, g, b)
        self.update(r: r, g: g, b: b)
        p (
                Light.RGBtoXYZ(r, g, b)
        )
        self.sendBody(
                Light.RGBtoXYZ(r, g, b)
        )
    end
    def render
        return {
            "name" => self.name,
            "custom" => self.custom,
            "state" => self.state,
            "currentColor" => [
                self.r,
                self.g,
                self.b
            ]
        }
    end
    def self.interpretor(h)
        light = Light.where(id: h["id"])[0]
        p light
        if h.has_key?("color")
            color = h["color"]
            light.set_color(color[0], color[1], color[2])
        end
        if h.has_key?("luminosity")
            if h["luminosity"].is_a?(String)
                p "string"
                p h["luminosity"]
            else
                p "integer"
                p h["luminosity"]
            end
        end
        if h.has_key?("state")
            if h["state"] == true
                light.turn_on
            else
                light.turn_off
            end
        end
        return light
    end
    def has_valid_color?
        return (self.r != nil && self.g != nil && self.b != nil)
    end
    def self.RGBtoXYZ(red, green, blue)
        if(red > 0.04045)
            red = ((red + 0.055) / (1.0 + 0.055) ** 2.4)
        else
            red = red / 12.92
        end
        if(green > 0.04045)
            green = ((green + 0.055) / (1.0 + 0.055) ** 2.4)
        else
            green = green / 12.92
        end
        if(blue > 0.04045)
            blue = ((blue + 0.055) / (1.0 + 0.055) ** 2.4)
        else
            blue = blue / 12.92
        end
        x = red * 0.664511 + green * 0.154324 + blue * 0.162028;
        y = red * 0.283881 + green * 0.668433 + blue * 0.047685;
        z = red * 0.000088 + green * 0.072310 + blue * 0.986039;
        rx = (x / (x + y + z)).round(4);
        ry = (y / (x + y + z)).round(4);
        return{
            "xy" => [
                rx,
                ry
            ]
        }
    end
    def self.fetchLights
        #philips hue
        #result of the api call to get all the lights
        ph = JSON.parse Net::HTTP.get("192.168.1.37", "/api/e40b-vlXo73fUxwfaS5oex7CLSWRPaFEO92RrprG/lights/")
        sph = Light.where(custom: false)
        ph.keys.map do |light|
            if !sph.any?{
                    |savedLight| savedLight.name == ph[light]["name"]
                }
                    Light.create(name: ph[light]["name"], custom: false, id_ip: light, room: Room.first)
            end
        end
    end

    def to_css_rgb
        return "rgb(#{self.r}, #{self.g}, #{self.b})"
    end
end
