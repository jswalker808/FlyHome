Bird = Class{}

local GRAVITY = 20

function Bird:init()
    self.image = love.graphics.newImage('sprites/bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = 20
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)
    
    self.dy = 0
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy
end

function Bird:render()
    love.graphics.push()
    love.graphics.scale(0.5, 0.5)
    love.graphics.draw(self.image, self.x, self.y)
    love.graphics.pop()
end