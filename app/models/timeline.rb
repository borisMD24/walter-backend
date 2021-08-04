class Timeline < ApplicationRecord
    
end


=begin
    FORMAT 
    ######
    #
    ###
    # * 2
    #
 {
     "header" : {
        "duration" : ms,
        "loop" : bool,
        "room" : room_id
     }
     "content" : [
            {
                "light" : light_id,
                "color" : {
                    "r" : int,
                    "g" : int,
                    "b" : int
                },
                "duration" : ms,
                "delay" : ms
            }
        ]
 }
=end