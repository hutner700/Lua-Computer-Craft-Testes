lado = 1
while true do
    for i=1,15 do

        for a=1,47 do
            shell.run('main.lua')
        end

        if (math.fmod(lado,2) == 1) then
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            turtle.digUp()
            turtle.digDown()
            lado = lado + 1
        else
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            turtle.digUp()
            turtle.digDown()
            lado = lado + 1
        end
    
    end
    turtle.digDown()
    turtle.down()
    turtle.digDown()
    turtle.down()
    lado = lado + 1
end

