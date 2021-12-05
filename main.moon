export distanceBetween = (x1, y1, x2, y2) ->
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

love.load =->

	export *

	target = {}
	with target
		.x      = 300
		.y      = 300
		.radius = 50
	
	timer, score = 0, 0
	gameFont     = love.graphics.newFont(40) 

love.update = (dt) ->

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

love.mousepressed = (x, y, button, istouch, presses) ->
	if (button == 1) then
		mouseToTarget = distanceBetween(x, y, target.x, target.y)

		if (mouseToTarget < target.radius) then
			export score = score + 1
			with target
				.x = math.random(0 + .radius, love.graphics.getWidth! - .radius) 
				.y = math.random(0 + .radius, love.graphics.getHeight! - .radius) 

	