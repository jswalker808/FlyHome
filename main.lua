push = require 'push'
Class = require 'class'
require 'Bird'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 240
VIRTUAL_HEIGHT = 135

local background = love.graphics.newImage('sprites/background.png')
local backgroundScroll = 0

local buildings1 = love.graphics.newImage('sprites/buildings1.png')
local buildings1Scroll = 0

local buildings2 = love.graphics.newImage('sprites/buildings2.png')
local buildings2Scroll = 0

local BACKGROUND_SCROLL_SPEED = 25
local BUILDINGS_1_SCROLL_SPEED = 60
local BUILDINGS_2_SCROLL_SPEED = 50

local bird = Bird()

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Fly Home')

    font = love.graphics.newFont('font.ttf', 8)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)

    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) 
        % VIRTUAL_WIDTH

    buildings1Scroll = (buildings1Scroll + BUILDINGS_1_SCROLL_SPEED * dt)
        % VIRTUAL_WIDTH
    
    buildings2Scroll = (buildings2Scroll + BUILDINGS_2_SCROLL_SPEED * dt)
        % VIRTUAL_WIDTH

end

function love.draw()
    push:start()

    love.graphics.draw(background, -backgroundScroll, 0)
    love.graphics.draw(background, VIRTUAL_WIDTH - backgroundScroll, 0)

    love.graphics.draw(buildings2, -buildings2Scroll, 0)
    love.graphics.draw(buildings2, VIRTUAL_WIDTH - buildings2Scroll, 0)

    love.graphics.draw(buildings1, -buildings1Scroll, 0)
    love.graphics.draw(buildings1, VIRTUAL_WIDTH - buildings1Scroll, 0)

    bird:render()

    displayFPS()

    push:finish()
end

function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(font)
    love.graphics.setColor(0, 255/255, 0, 255/255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    love.graphics.setColor(255, 255, 255, 255)
end