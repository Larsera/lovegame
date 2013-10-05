local lg = love.graphics

function love.load()
        background = love.graphics.newImage("bg.png")
        player = lg.newImage("player.png")
        player_y = 0
        player_x = 0
        velY = 0
        velX = 0
        speedlimit = 5
        friction = 0.96

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

        if player_y + 64 >= lg.getHeight() then
                player_y = lg.getHeight() -64
                velY = -velY
        end
        if player_x + 64 >= lg.getWidth() then
                player_x = lg.getWidth() - 64
                velX = -velX
        end

        if player_y <= 0 then 
                player_y = 0
                velY = -velY
        end
        if player_x <= 0 then
                player_x = 0
                velX = -velX
        end
end

function love.draw()
        love.graphics.draw(background, 0, 0)
        lg.draw(player, player_x, player_y)
        lg.print("X: " .. player_x, 100, 100)
        lg.print("Y: " .. player_y, 100, 120)
end

