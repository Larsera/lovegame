require "player"

local lg = love.graphics

-- location to save all images
imgs = {}
function imgs.insert(name)
        imgs[name] = lg.newImage(name)
end

function love.load()
        imgs.insert("bg.png")
        imgs.insert("player.png")
        background = imgs["bg.png"]
        player.load(0, 0, "player.png")

end

function love.update(dt)
        player.update(dt)
end

function love.draw()
        love.graphics.draw(background, 0, 0)
        player.draw()
end
