lado = 1
while true do
    
    for i=1,8 do

        for i=1,15 do
            turtle.forward()
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

        for i=1,15 do
            turtle.forward()
        end

        if (math.fmod(lado,2) == 1) then
            if i < 8 then
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
            end
        else
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
        end

    turtle.digDown()
    turtle.Down()
    turtle.digDown()
    turtle.Down()
    lado = lado + 1
end