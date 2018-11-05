-- Title: MathQuiz
--  Name: Brett Shango
-- Course: ICS20/3c
-- This Programs  displays a math question and asks the user to answer in a numeric textfield.
------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


--set the background color
display.setDefault( "background", 51/255, 155/255, 153/255 )

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer

local gameOver
local GameOverChannel

local youWin
local YouWinSoundChannel

local lives = 3
local heart1
local heart2
local heart3

-- create other vaiables
local questionObject
local correctObject
local incorrectObject

local numericField

local randomNumber1
local randomNumber2
local temp
local randomOperator

local correctAnswer

local pointsTextObject
local numberCorrect = 0


--------------------------------------------------------
-- SOUNDS
--------------------------------------------------------
--correct sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel

--Incorrect Sound
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel

-- GameOver Sound 
local GameOverSound = audio.loadSound("Sounds/GameOver.mp3")
local GameOverSoundChannel

-- YouWin Sound 
local YouWinSound = audio.loadSound("Sounds/You Win.mp3")
local YouWinSoundChannel
--------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------
local function ShowGameOver()
	-- Dislays the game over image and sound 
	gameOver.isVisible = true
	GameOverSoundChannel = audio.play(GameOver)
end


local function ShowYouWin()
	-- Dislays the game over image and sound 
	youWin.isVisible = true
	YouWinSoundChannel = audio.play(YouWin)
end

local function UpdateHearts()
 	if (lives == 3) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = true
      

     
      elseif (lives == 2) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = false
     

     elseif (lives == 1) then
      heart1.isVisible = true
      heart2.isVisible = false
      heart3.isVisible = false
    

     elseif (lives == 0) then
      heart1.isVisible = false
      heart2.isVisible = false
      heart3.isVisible = false
      timer.performWithDelay(1000,ShowameOver)
      GameOverSoundChannel = audio.play(gameOver)
      gameOver.isVisible = true
      numericField.isVisible = false
      pointsTextObject.isVisible = false
      questionObject.isVisible = false
    end
end


	



local function UpdateTime()
 -- decrement the number of seconds left
 secondsLeft = secondsLeft - 1
 
 --clock object
 clockText.text = secondsLeft .. ""
 
 if (secondsLeft == 0 ) then
  --reset the  number of seconds left 
  secondsLeft = totalSeconds
  -- restart the game when all lives are lost.
  lives = lives - 1


  --***IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND,s
  --SHOW A "YOU LOSE IMAGE AND CANCEL THE TIMER, REMOVE
  --REMOVE THE THIRD HEART BY MAKIND IT INVISIBLE
     UpdateHearts()
  --*** CALL THE FUNCTION TO ASK A NEW QUESTION
 end
end
------------------------------------------------------------------------
-- function that calls the timer
local function StartTime()
 -- create a countdown timer that loops infinitely
 countDownTimer = timer.performWithDelay( 2000, UpdateTime, 0)
end



-- local functions 
local function AskQuestion()
 	-- generate 2 random numbers between a max. and a min. number
 	randomOperator = math.random(1,4)

 	
 	
  	if (randomOperator == 1) then
  		-- Creates the sum of the answer with addition.
   		randomNumber1 = math.random (1,20)
   		randomNumber2 = math.random (1,20)


   		correctAnswer = randomNumber1 + randomNumber2

 
  		-- Displays the the question on the screen with addiion.
 		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
 
 	elseif (randomOperator == 2) then
  		-- Creates the difference of the answer with subtraction.
   		randomNumber1 = math.random (1,20)
   		randomNumber2 = math.random (1,20)

   		if (randomNumber1 < randomNumber2) then
   			temp = randomNumber1
   			randomNumber1 = randomNumber2
   			randomNumber2 = temp
   			correctAnswer = randomNumber1 - randomNumber2
   		end
      	correctAnswer = randomNumber1 - randomNumber2	

   		-- Displays the the question on the screen with subtraction.																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														
 		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
   
 		
 		 
  	elseif (randomOperator == 3) then
 		-- Creates the product of the answer with multiplication
   		randomNumber1 = math.random (1,10)
   		randomNumber2 = math.random (1,10)
   		
   		correctAnswer = randomNumber1 * randomNumber2
   		
   		-- Displays the the question on th screen with Multiplication
  		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

  	elseif (randomOperator == 4) then
 		-- Creates the product of the answer with division
   		randomNumber1 = math.random (1,100)
   		randomNumber2 = math.random (1,100)
   		
   		if (randomNumber1 < randomNumber2) then
   			temp = randomNumber1
   			randomNumber1 = randomNumber2
   			randomNumber2 = temp
   			correctAnswer = randomNumber1 / randomNumber2
   		end
      	correctAnswer = randomNumber1 /randomNumber2	
   		
   		-- Displays the the question on th screen with Multiplication
  		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

  	

   	end
end


local function HideCorrect()
 correctObject.isVisible = false
 AskQuestion()
end
local function HideIncorrect()
 incorrectObject.isVisible = false 
 AskQuestion()
end


	

local function NumericFieldListener( event )
 
	--User begins editing "numericFeild"
	if ( event.phase == "began" ) then
 
		--clear text field 
  		event.target.text = ""
    
 	elseif (event.phase == "submitted") then
  		-- when the answer is submitted (enter key is pressed) set user input bto user's answer
  		userAnswer = tonumber(event.target.text)
  
   
    	-- if the user's answer and the correct answer and the correct answer are the same:
  		if  (userAnswer == correctAnswer) then
  	
  			-- the correct object is visible 
    		correctObject.isVisible = true 
   
   			-- Plays the correct sound 
    		correctSoundChannel = audio.play(correctSound)
    
    		-- since answer is correct, the incorrect object becomes invisible.
     		incorrectObject.isVisible = false

     		-- this calls hide correct after two seconds
    		timer.performWithDelay(2000,HideCorrect)
   
   		 	-- This increases the points by one for each answer we get right.
    		numberCorrect = numberCorrect + 1

   			-- Displays the points
    		pointsTextObject.text = "numberCorrect = ".. numberCorrect
    
    		-- Clears the text field 
    		event.target.text = ""

    		-- reset the number of seconds back to the total amount of seconds  
    		secondsLeft = totalSeconds


		else

			-- The incorrect object becomes visible
			incorrectObject.isVisible = true
    
    		-- Plays the incorrect sound
    		wrongSoundChannel = audio.play(wrongSound)
    
    		-- Decreases the amount of hearts for each answer the user gets wrong
    		UpdateHearts()
    
   		 	-- since answer is Incorrect, the correct object becomes invisible.
    		correctObject.isVisible = false


    		incorrectObject.text = "The correct answer is " .. correctAnswer

    		-- Removes one heart for each question answered incorrectly
   		 	lives = lives - 1

   		 	-- gameOver sound appears 
            GameOverChannel = audio.play(GameOver)

   			-- this calls HideIncorrect after two seconds
    		timer.performWithDelay(2000,HideIncorrect)
    
    		-- Clears the text field
   	 		event.target.text = "" 

   			-- reset the number of seconds back to the total amount of seconds 
    		secondsLeft = totalSeconds

        end
 	end
end





-- if the numberCorrect is five then:
if  (numberCorrect == 5) then
  	
  	-- the youWin image is visible 
    youWin.isVisible = true 
   
   	-- Plays the youWin sound 
    YouWinSoundChannel = audio.play(YouWinSound)
    
    -- since the youWin image is visible , the gameOver image  becomes invisible.
    gameOver.isVisible = false

    -- this calls hide youWin after two seconds
    timer.performWithDelay(2000,HideyouWin)
  
   	-- reset the number of seconds back to the total amount of seconds  
	secondsLeft = totalSeconds
end
------------------------------------------------------------
-- OBJECTS CREATION
------------------------------------------------------------
-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7
heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


-- display the timer on the screen
clockText = display.newText(secondsLeft, 520, 680, nil, 190)
clockText:setFillColor( 144/255, 234/255, 86/255 )

 
-- create and display gameOver on the screen

gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
gameOver.anchorX = 0
gameOver.anchorY = 0
gameOver.isVisible = false
GameOverChannel = audio.play(GameOver)

youWin = display.newImageRect("Images/youWin.png", display.contentWidth, display.contentHeight)
youWin.anchorX = 0
youWin.anchorY = 0
youWin.isVisible = false
youWinSoundChannel = audio.play(youWin)


-- create points box and make it visible
pointsTextObject = display.newText( "numberCorrect = ".. numberCorrect, 790, 400, nil, 50 )
pointsTextObject:setTextColor(24/255, 119/255, 25/255)

-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 80)
questionObject:setTextColor(56/255, 234/255, 100/255)

-- create the correct text object and make it invisible
correctObject = display.newText("All right", display.contentWidth/2,  250, nil, 50)
correctObject:setTextColor(135/255, 34/255, 195/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText("Incorrect", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(135/255, 34/255, 195/255)
incorrectObject.isVisible = false
-----------------------------------------------------------
-- CREATE THE NUMERIC FIELD 
------------------------------------------------------------
numericField = native.newTextField(display.contentWidth/2, display.contentHeight*2/3, 150, 150, nil, 50)
numericField.inputType = "default"

-- change the width of the ground, for it to be the same as the screen
numericField.width = display.contentWidth
numericField.x = display.contentWidth/2


--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)
---------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------
-- call the function to ask the Question
AskQuestion()
StartTime()

