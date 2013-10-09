lg = love.graphics
Tile = {}
Tile.cor_x = 0
Tile.cor_y = 0
Tile.solid = false

function Tile:load(x, y, img, sol)
        self.cor_x = x
        self.cor_y = y
        self.texture = imgs[img]
        self.solid = sol
end

function Tile:draw()
        lg.draw(self.texture, self.cor_x, self.cor_y)
end

function Tile:new()
        o = o or {} 
        setmetatable(o, self)
        self.__index = self
        return o
end
