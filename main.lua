-----------------------------------------------------------------------------------------
-- Taisei Scott
-- Touch and Drag
-- This program changes when I click on the image
-----------------------------------------------------------------------------------------

--Background Colour
display.setDefault ("background", 0.5)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--blue button, visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/4
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--red button, not visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/4
redButton.y = display.contentHeight/2
redButton.isVisible = false

--text, invisible
local textObject = display.newText("Ctrl-Alt-Del", 0, 0, nil, 50)
textObject.x = display.contentWidth/4
textObject.y = blueButton.y-100
textObject:setTextColor(0, 1, 1)
textObject.isVisible = false

--other Buttons/Images
local submitiInactive = display.newImageRect("Images/submit1.png", 315, 160)
submitiInactive.x = display.contentWidth*3/4
submitiInactive.y = display.contentHeight/2
submitiInactive.isVisible = true

local submitActive = display.newImageRect("Images/submit2.png", 315, 160)
submitActive.x = submitiInactive.x
submitActive.y = submitiInactive.y
submitActive.isVisible = false

local captain = display.newImageRect("Images/Captain Falcon.png", 750, 650)
captain:scale(0.5, 0.5)
captain.x = submitiInactive.x
captain.y = submitiInactive.y-200
captain.isVisible = false

--audio
local fZero = audio.loadSound("Audio/mute city.mp3")
local yes = audio.loadSound("Audio/YES.mp3")

--function
--When Blue Button is pressed, image becomes invisible, red button becomes visible,
--text appears
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		audio.stop()
		redButton.isVisible = true
		textObject.isVisible = true
		audio.play(fZero)
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

--function
--When Red button is released, make blue button reappear, text dissapear, red button dissapear
local function RedButttonListener(touch)
	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end


local function Submit1Listener(touch)
	if (touch.phase == "began") then
		submitiInactive.isVisible = false
		submitActive.isVisible = true
		captain.isVisible = true
		audio.play(yes)
	end

	if (touch.phase == "ended") then
		submitiInactive.isVisible = true
		submitActive.isVisible = false
		captain.isVisible = false
	end
end

local function Submit2Listener(touch)
	if (touch.phase == "ended") then
		submitiInactive.isVisible = true
		submitActive.isVisible = false
		captain.isVisible = false
	end
end



blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButttonListener)
submitiInactive:addEventListener("touch", Submit1Listener)
submitActive:addEventListener("touch", Submit2Listener)