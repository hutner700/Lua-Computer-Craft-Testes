lado = 1
while true do
    for i=1,8 do

        for a=1,15 do
            shell.run('main.lua')
        end

        if (math.fmod(lado,2) == 1) then
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
        else   
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
        end

        for b=1,15 do
            shell.run('main.lua')
        end

        if (math.fmod(lado,2) == 1) then
            if i < 8 then
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
            else
                turtle.turnLeft()
                turtle.turnLeft()
            end
        else
            if i < 8 then
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
            else
                turtle.turnLeft()
                turtle.turnLeft()
            end

        end
    end
    turtle.digDown()
    turtle.down()
    turtle.digDown()
    turtle.down()
    lado = lado + 1
end