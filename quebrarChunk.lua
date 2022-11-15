while true do
    for i=1,15 do 
        for i=1,31 do -- anda dois chunks para frente
            shell.run("main.lua")
        end
        turtle.turnLeft()
        turtle.forward()
        turtle.turnLeft()
        for i=1,31 do -- anda dois chunks para frente
            shell.run("main.lua")
        end
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
    end
end