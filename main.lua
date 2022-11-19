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

function quebrar_frente()
    andou = false
    while (not andou) do
        quebrou = turtle.dig()
        andou = turtle.forward()
        if not quebrou then
            error()
        end
    end
end

function work()
    combustivel = turtle.getFuelLevel()
    if (combustivel == 0) then
        reabastecerCombustivel()
    end
    quantidade_ultimo_slot = turtle.getItemCount(16)
    if (quantidade_ultimo_slot > 0) then
        esvaziarInventario()
    end
    andou = false
    quebrou = nil
    desvio = false
    
    turtle.digUp()
    turtle.digDown()
end

function virar( curva )
    if curva == 1 then
        turtle.turnLeft()
        andou = turtle.forward()
        quebrar_frente()
        turtle.turnLeft()
        turtle.digUp()
        turtle.digDown()
        curva = 2
    elseif curva == 2 then
        turtle.turnRight()
        andou = turtle.forward()
        quebrar_frente()
        turtle.turnRight()
        turtle.digUp()
        turtle.digDown()
        curva = 1
    end
    return curva
end

function descer()
    for i=1,3 do
        turtle.digDown()
        turtle.down()
    end
end

while true do 
    for j=1,14 do
        for i=1,13 do
            work()
        end
    curva = virar(curva)
    end
    turtle.turnRight()
    for z=1,14 do
        turtle.forward()
    end
    turtle.turnLeft() 
    descer()
end


