-- Formula to calculate the distance between the mouse and the circle's center when clicking

export distanceBetween = (x1, y1, x2, y2) ->
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

-- Function to move the circle elsewhere

export moveCircle =->

	with target

		-- Random x / y value between 0 and the difference of the screen width / height and the circle radius

		.x = math.random(0 + .radius, love.graphics.getWidth! - .radius) 
		.y = math.random(0 + .radius, love.graphics.getHeight! - .radius) 

-- Set game window title

love.window.setTitle("Target Test ~ by Wither")

-- Runs when the game first loads

love.load =->

	export *

	target = {}
	with target
		.x      = 300
		.y      = 300
		.radius = 50
	
	timer, score = 0, 0
	gameFont     = love.graphics.newFont(40) 
	countdown    = 1.5

-- Run and update block of code after the game's initial load

love.update = (dt) -> 
	export countdown = countdown - dt

	if countdown <= 0 then
		moveCircle!
		export countdown = 1.5 -- Without this line of code to reset the countdown, the circle would fly all over the screen

-- Important note: y increases DOWNWARDS in Löve, NOT upwards

love.draw =->
	with love.graphics

		-- Make and colour the target

		.setColor(1, 0, 0)
		.circle("fill", target.x, target.y, target.radius)

		-- Make and colour the score counter

		.setColor(1, 1, 1)
		.setFont(gameFont)
		.print(score, 0, 0)

-- Did the user click the left mouse button? If so, run the code below.

love.mousepressed = (x, y, button, istouch, presses) ->
	if (button == 1) then
		mouseToTarget = distanceBetween(x, y, target.x, target.y)

		-- Is the distance between the mouse cursor and the circle center smaller than the circle radius?

		if (mouseToTarget < target.radius) then
			export score = score + 1
			export countdown = 1.5 -- Reset countdown whenever you successfully click the circle
			moveCircle!

	