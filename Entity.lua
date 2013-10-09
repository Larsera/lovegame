lg = love.graphics
Entity = {}
Entity.cor_x = 0
Entity.cor_y = 0
Entity.vel_x = 0
Entity.vel_y = 0
Entity.speedlimit = 40
Entity.friction = 0.94

function Entity:load(x, y, img)
        self.cor_x = x
        self.cor_y = y
        self.texture = imgs[img]
end

function Entity:draw()
        lg.draw(self.texture, self.cor_x, self.cor_y)
end

function Entity:update(dt)
        local sh = lg.getHeight()
        local sw = lg.getWidth()

        if love.keyboard.isDown("up") then
                if self.vel_y > - self.speedlimit then
                        self.vel_y = self.vel_y - 1
                end
        end
        if love.keyboard.isDown("down") then
                if self.vel_y < self.speedlimit then
                        self.vel_y = self.vel_y + 1
                end
        end
        if love.keyboard.isDown("right") then
                if self.vel_x < self.speedlimit then
                        self.vel_x = self.vel_x + 1
                end
        end
        if love.keyboard.isDown("left") then
                if self.vel_x > - self.speedlimit then
                        self.vel_x = self.vel_x - 1
                end
        end
        if love.keyboard.isDown(" ") then
                if self.cor_y >= sh - 64 then
                        self.vel_y = self.vel_y - 15
                end
        end

        self.vel_y = self.vel_y * self.friction
        self.cor_y = self.cor_y + self.vel_y
        self.vel_x = self.vel_x * self.friction
        self.cor_x = self.cor_x + self.vel_x

        if self.cor_y + 64 < sh then
                self.vel_y = self.vel_y + World.gravity
        end

        if self.cor_y + 64 >= sh then
                self.cor_y = sh - 64
                if math.abs(self.vel_y) > 3.8 then self.vel_y = - self.vel_y end
        end

        if self.cor_x + 64 >= sw then
                self.cor_x = sw - 64
                self.vel_x = - self.vel_x
        end

        if self.cor_y < 0 then
                self.cor_y = 0
                self.vel_y = - self.vel_y

        end

        if self.cor_x < 0 then
                self.cor_x = 0
                self.vel_x = - self.vel_x
        end

        if math.abs(self.vel_y) < 0.1 then self.vel_y = 0 end
        if math.abs(self.vel_x) < 0.1 then self.vel_x = 0 end
end

function Entity:new(o)
        o = o or {} 
        setmetatable(o, self)
        self.__index = self
        return o
end

return Entity
