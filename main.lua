require "player"

local lg = love.graphics


function love.load()
        background = lg.newImage("bg.png")
        player.load(0, 0, "player.png")

end

function love.update(dt)
        player.update(dt)
end

function love.draw()
        love.graphics.draw(background, 0, 0)
        player.draw()
end
