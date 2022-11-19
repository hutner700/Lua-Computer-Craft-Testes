function reabastecerCombustivel()
    turtle.select(2)
    turtle.placeUp()
    if turtle.getItemCount() == 0 then
        turtle.suckUp(64)
        turtle.refuel(64)
        turtle.digUp()
    else
        turtle.select(1)
        turtle.place()
        turtle.select(2)
        turtle.drop()
        turtle.suckUp(64)
        turtle.refuel(64)
        turtle.digUp()
        turtle.select(1)
        turtle.dig()
    end

end

function esvaziarInventario()
    turtle.select(1)
    turtle.placeUp()
    turtle.dropUp()
    for i=3,16 do
        turtle.select(i)
        turtle.dropUp()
    end
    turtle.select(1)
    turtle.digUp()
end


Position = {x=0,y=0,z=0,orientation = 0}
 -- orientation : 0 Norte, 1 - East, 2 - Sul, - 3 West
function Position.forward ()
    if Position.orientation == 0 then
        Position.z = Position.z - 1
    elseif Position.orientation == 1 then
        Position.x = Position.x + 1
    elseif Position.orientation == 2 then
        Position.x = Position.z + 1
    elseif Position.orientation == 3 then
        Position.x = Position.x - 1
    end
  end

function Position.TurnRight()
    nova_orientacao = Position.orientation + 1
    if nova_orientacao == 4 then
        nova_orientacao = 0
    end
    Position.orientation = nova_orientacao
end

function Position.TurnLeft()
    nova_orientacao = Position.orientation - 1
    if nova_orientacao == -1 then
        nova_orientacao = 3
    end
    Position.orientation = nova_orientacao
end

function Position.Up()
    Position.y = Position.y + 1
end

function Position.Down()
    Position.y = Position.y - 1
end


print("Digite a coordenada do Eixo X")
-- eixox = tonumber(read())
eixox = 0
print("Digite a coordenada do Eixo Y")
-- eixoy = tonumber(read())
eixoy = 0
print("Digite a coordenada do Eixo Z")
-- eixoz = tonumber(read())
eixoz = 0
print("Digite a orientação, 0 para Norte, 1 East, 2 Sul, 3 West")
-- orient = tonumber(read()) 
orient = 0

GPS = Position
GPS.x= eixox
GPS.y= eixoy
GPS.z= eixoz
GPS.orientation= orient
-- orientation : 0 Norte, 1 - East, 2 - Sul, - 3 West
limitex = eixox - 15
limitez = eixoz - 15

while true do 
    combustivel = turtle.getFuelLevel()
    if (combustivel == 0) then
        reabastecerCombustivel()
    end
    quantidade_ultimo_slot = turtle.getItemCount(16)
    if (quantidade_ultimo_slot > 0) then
        esvaziarInventario()
    end
    if (GPS.x == limitex and GPS.z == limitez) then
        turtle.turnRight()
        GPS.TurnRight()
        for i=1,15 do
            turtle.forward()
            GPS.forward()
        end
        GPS.turnRight()
        turtle.turnRight()
        for i=1,15 do
            turtle.forward()
            GPS.forward()
        end
        turtle.digDown()
        turtle.down()
        turtle.digDown()
        turtle.down()
        GPS.Down()
        GPS.Down()
        turtle.turnLeft()
        GPS.TurnLeft()
        turtle.turnLeft()
        GPS.TurnLeft()
    end
    if (GPS.orientation == 0 and GPS.x == limitex) then
        turtle.turnLeft()
        GPS.TurnLeft()
        turtle.dig()
        turtle.forward()
        GPS.forward()
        turtle.digUp()
        turtle.digDown()
        turtle.turnLeft()
        GPS.TurnLeft()
    end
    if (GPS.orientation == 2 and GPS.x == eixox)
        turtle.turnRight()
        GPS.TurnRight()
        turtle.dig()
        turtle.forward()
        GPS.forward()
        turtle.digUp()
        turtle.digDown()
        turtle.turnRight()
        GPS.turnRight()
    end
    
    andou = false
    quebrou = nil
    desvio = false
    while (not andou) do
        quebrou = turtle.dig()
        andou = turtle.forward()
        if not quebrou then
            desvio = true
            break
        end
    end
    turtle.digUp()
    turtle.digDown()
    GPS.forward()

end