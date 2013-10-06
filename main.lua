require "World"
require "player"
require "Entity"

local lg = love.graphics

-- location to save all images
imgs = {}
function imgs.insert(name)
        imgs[name] = lg.newImage(name)
end

World = {}
World.gravity = 0.8
setmetatable(player, World)
e1 = Entity:new()
e2 = Entity:new()
--setmetatable(e2, {__index = e1})

function love.load()
        imgs.insert("bg.png")
        imgs.insert("player.png")
        background = imgs["bg.png"]

        e1:load(50, 50, "player.png")
        e2:load(100, 100, "player.png")
        e1.friction = 0.90
end

function love.update(dt)
        e1:update(dt)
        e2:update(dt)
end

function love.draw()
        love.graphics.draw(background, 0, 0)
        e1:draw()
        e2:draw()
end
