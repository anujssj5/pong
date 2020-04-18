--[[
    GD50 2018
    Pong Remake

    -- Ball Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Represents a ball which will bounce back and forth between paddles
    and walls until it passes a left or right boundary of the screen,
    scoring a point for the opponent.
]]

CircularBall = Class{}

function CircularBall:init(x, y, radius, segments)
    self.x = x
    self.y = y
    self.radius = radius
    self.segments = segments

    -- these variables are for keeping track of our velocity on both the
    -- X and Y axis, since the ball can move in two dimensions
    self.dy = 0
    self.dx = 0
end

--[[
    Expects a paddle as an argument and returns true or false, depending
    on whether their rectangles overlap.
]]
function CircularBall:collides(paddle)
    -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x + self.radius > paddle.x + paddle.width or paddle.x > self.x + self.radius then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y +self.radius > paddle.y + paddle.height or paddle.y > self.y + self.radius then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

--[[
    Places the ball in the middle of the screen, with no movement.
]]
function CircularBall:reset()
    self.x = VIRTUAL_WIDTH / 2 
    self.y = VIRTUAL_HEIGHT / 2 
    self.dx = 0
    self.dy = 0
end

function CircularBall:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function CircularBall:render()
    love.graphics.circle('fill', self.x, self.y, self.radius, self.segments)
end