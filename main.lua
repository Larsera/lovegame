local lg = love.graphics

function love.load()
        background = love.graphics.newImage("bg.png")
        player = lg.newImage("player.png")
        player_y = 0
        player_x = 0
        velY = 0
        velX = 0
        speedlimit = 2
        friction = 0.98

end

function love.update(dt)
        if love.keyboard.isDown("up") then
                if velY > -speedlimit then
                        velY = velY - 1
                end
        end
        if love.keyboard.isDown("down") then
                if velY < speedlimit then
                        velY = velY + 1
                end
        end
        if love.keyboard.isDown("right") then
                if velX < speedlimit then
                        velX = velX + 1
                end
                
        end
        if love.keyboard.isDown("left") then
                if velX > -speedlimit then
                        velX = velX - 1
                end
        end
        velY = velY * friction
        player_y = player_y + velY
        velX = velX * friction
        player_x = player_x + velX
end

function love.draw()
        love.graphics.draw(background, 0, 0)
        lg.draw(player, player_x, player_y)
end

