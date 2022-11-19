GPS.__index = GPS

function GPS.new(arg)
    local object = {}
    setmetatable(object, GPS)
  
  	object.arg = arg
  
    return object
end

function GPS.forward()
  self.x = self.x + 1
end