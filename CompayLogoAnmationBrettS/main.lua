-- Title: CompanyLogoAnimation
-- Name: Brett Shango
-- Course: ICS20/3C
-- This program displays the image of the princess  move across the screen




-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables  
scrollSpeed = 7



-----------------------------------------------------
--SOUNDS
--------------------------------------------------------


-- Hello Sound 
local princessSound = audio.loadSound("Sounds/princessSound.mp3")
local princessSoundChannel
----------------------------------------------------------------
-- background image with width and height
local backgroundImage = display.newImageRect("Images/princess2.png", 2048, 1536)
-------------------------------------------------------------------------
-- character image with width and height 
local princess = display.newImageRect("Images/princess.png", 200, 200)





-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--set the images to be transparent
princess.alpha = 0

--set the initial x and y position of beetleship and planet
princess.x = 0
princess.y = display.contentHeight / 2


-- grow  the princess size
princess.xScale = 3
princess.yScale = 3


-- set initial textObject on the screen
local textObject = display.newText("Go Go Little Pink", 500, 500, nil, 50)
textObject.x = 500
textObject.y = 700
textObject:setTextColor (2, 0, 0)   
textObject.x = textObject.x + scrollSpeed 

--Function: MoveShip
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the ship
local function MovePrincess(event)
	-- add the scroll speed to the x-value of the ship
	princess.x = princess.x + scrollSpeed
    -- change the transparency of the ship every time it so fast that it fades out
	princess.alpha = princess.alpha + 0.01
----------------------------------------------------------------------------------------------------
end

local function MoveText(event)
	-- add the scroll speed to the x-value of the textObject
	textObject.x = textObject.x - scrollSpeed
    -- change the transparency of the ship every time it so fast that it fades out
    textObject.alpha = textObject.alpha - 0.0000000000000000000000000000000000000001
end


--This sound plays when princesss appeares on the screen
princess.isVisible = true 
princessSoundChannel = audio.play(princessSound)


-----------------------------------------------------------------
-- MovePrincess
Runtime:addEventListener("enterFrame", MovePrincess)
Runtime:addEventListener("enterFrame", MoveText)

