require "Entity"
require "Tile"

local lg = love.graphics

World = {}
World.gravity = 9

-- location to save all images
imgs = {}
function imgs.insert(name)
        imgs[name] = lg.newImage(name)
end

World = {}
World.gravity = 0.8
e1 = {}
Entity:new(e1)
s1 = Tile:new() 
--setmetatable(e2, {__index = e1})

function love.load()
        imgs.insert("bg.png")
        imgs.insert("player.png")
        imgs.insert("solid.png")
        background = imgs["bg.png"]
        e1:load(50, 50, "player.png")
        s1:load(200, 100, "solid.png")
end

function love.update(dt)
        e1:update()
end

function love.draw()
        love.graphics.draw(background, 0, 0)
        e1:draw()
        s1:draw()
end
