combustivel = turtle.getFuelLevel()
if (combustivel == 0) then
    shell.run("reabastecer.lua")
end
ultimo_slot = turtle.getItemCount(16)
if (ultimo_slot > 0) then
    shell.run("esvaziar.lua")
end
shell.run("break.lua")