function esvaziarInventario( ... )
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
