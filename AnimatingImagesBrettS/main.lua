-- Title: AnimatingImages 
--  Name: Brett Shango
-- Course: ICS20/3c
-- This Programs displays animated images that can move in opposite direction.
-- 
-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variableslocal backgroundImage = display.newImageRect("Images/Thor_The_Dark_World_Asgard.png", 2120, 1550)

ScrollSpeed2 = 3
Scrollspeed = 2
ScrollSpeed3 = 4

-- local Variables. These are my images I will be using.

local Spaceship = display.newImageRect("Images/Spaceship.png", 600, 600)
local SpaceshipWidth = Spaceship.Width
local SpaceshipHeight = Spaceship.Height

local Titanic = display.newImageRect("Images/Titanic.png", 700, 700)
local TitanicWidth = Titanic.Width
local TitanicHeight = Titanic.Height

local Ship = display.newImageRect("Images/Ship.png", 500, 400)
local ShipWidth = Ship.Width
local ShipHeight = Ship.Height

local Ship13 = display.newImageRect("Images/Ship13.png", 300, 400)
Ship13: setFillColor(1, 1, 0)

-- spin the Ship13 vertically
Ship13.xScale = -1
Ship13.yScale = -2 -- change the vertical scale to 200%

local Ship13Width = Ship13.Width
local Ship13Height = Ship13.Height

-- Rotate the Ship13 360 degrees  
Ship13.xScale = -1
Ship13.yScale = -2

-- set initial textObject on the screen
local textColor = display.newText("Immersion Of Ships: By Brett !", 500, 500, nil, 50)
textColor.x = 500
textColor.y = 500
textColor:setTextColor (2, 4, 0)     


-- set intial position of the spaceship
Spaceship.x = 500
Spaceship.y = 700

Titanic.x = 500
Titanic.y = 400

Ship13.x = 300
Ship13.y = 400

Ship.x = 200
Ship.y = 300

-- set images to be transparent
Spaceship.alpha = 1
Titanic.alpha = 2
Ship.alpha = 1
Ship13.alpha = 6

-- set the initial x and y positon of the Spaceship.
Spaceship.x = 500     
Spaceship.y = display.contentHeight/3

Titanic.x = 600
Titanic.y = display.contentHeight/3

Ship.x = display.contentHeight/3
Ship.y = 300

Ship13.x = display.contentHeight/3
Ship13.y = 300

-- function: MoveSpaceship
-- input: this function accepts an event listner 
-- output: none 
--Description: This function adds the scroll speed to the x-value of the ship
local function MoveSpaceship(event)
	-- add the scroll speed to the x-value of the ship
	Spaceship.x = Spaceship.x + ScrollSpeed2
	Spaceship.y = Spaceship.y - ScrollSpeed2

    -- change the transparency of the rocketship every time it moves so fast that it fades out
	Spaceship.alpha = Spaceship.alpha - 0.00000000000001
end
---------------------------------------------------------------------------------------------------------------------------
-- function: MoveSpaceship
-- input: this function accepts an event listner 
-- output: none 
--Description: This function adds the scroll speed 2 to the x-value of the ship
local function MoveTitanic(event)
	-- add the scroll speed to the x-value of the ship
	Titanic.y = Titanic.y + Scrollspeed
    -- change the transparency of the rocketship every time it moves so fast that it fades out
	Titanic.alpha = Titanic.alpha - 0.00000000002
end
-------------------------------------------------------------------------------------------------------
-- function: MoveShip
-- input: this function accepts an event listner 
-- output: none 
--Description: This function adds the scroll speed 2 to the x-value of the ship, and makes it move down
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	Ship.y = Ship.y - Scrollspeed
    -- Spin  the transparency of the Ship13 every time it moves so fast that it fades out
	Ship.alpha = Ship.alpha / 0.1
end
--------------------------------------------------------------------------------------------------------------------------------
-- function: MoveSpaceship
-- input: this function accepts an event listner 
-- output: none 
--Description: This function adds the scroll speed 2 to the x-value of the ship
local function MoveShip13(event)
	-- add the scroll speed to the x-value of the ship
   Ship13.x = Ship13.x + Scrollspeed
    -- change the transparency of the rocketship every time it moves so fast that it fades out
	Ship13.alpha = Ship13.alpha - 0.00000000002
end

-- MoveSpaceShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveSpaceship)
Runtime:addEventListener("enterFrame", MoveTitanic)
Runtime:addEventListener("enterFrame", MoveShip)
Runtime:addEventListener("enterFrame", MoveShip13)
