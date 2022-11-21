function reabastecerCombustivel()
    turtle.select(2)
    colocarCima()
    if turtle.getItemCount() == 0 then
        turtle.suckUp(64)
        turtle.refuel(64)
        turtle.digUp()
    else
        turtle.select(1)
        turtle.dig()
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

function colocarCima()
    colocou = turtle.placeUp()
    while not colocou do
        atacou = turtle.attackUp()
        turtle.digUp()
        colocou = turtle.placeUp()
    end
end

function esvaziarInventario()
    turtle.select(1)
    colocarCima()
    turtle.dropUp()
    for i=3,16 do
        turtle.select(i)
        turtle.dropUp()
    end
    turtle.select(1)
    turtle.digUp()
end

function quebrar_frente()
    andou = false
    while (not andou) do
        quebrou = turtle.dig()
        andou = turtle.forward()
        if (not quebrou and not andou)  then
            error("Não consegui quebrar o bloco da frente")
        end
    end
end

function work()
    combustivel = turtle.getFuelLevel()
    if (combustivel < 1000) then
        reabastecerCombustivel()
    end
    quantidade_ultimo_slot = turtle.getItemCount(16)
    if (quantidade_ultimo_slot > 0) then
        esvaziarInventario()
    end
    quebrar_frente()
    turtle.digUp()
    turtle.digDown()
end

function virar( curva )
    if curva == 1 then
        turtle.turnLeft()
        quebrar_frente()
        turtle.turnLeft()
        turtle.digUp()
        turtle.digDown()
        curva = 2
    elseif curva == 2 then
        turtle.turnRight()
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

function main()
    curva = 1
    while true do 
        print("Iniciando a query")
        for j=1,14 do
            print("Iniciando a coluna "..tostring(j))
            for i=1,13 do
                print("Iniciando o trabalho na linha "..tostring(i))
                work()
            end
            texto = ""
            if curva == 1 then
                texto = "Esquerda"
            else
                texto = "Direita"
            end
            print("Fazendo a curva "..texto)
            curva = virar(curva)
        end
        turtle.turnRight()
        for z=1,14 do
            turtle.forward()
        end
        turtle.turnLeft() 
        descer()
    end
end

if not pcall(main)
    esvaziarInventario()
end

