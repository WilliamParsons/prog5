local brick = require 'components.brick'

function leftX(x)
	return x * brick.width
end

function rightX(x)
	return leftX(x) + brick.width
end

function topY(y)
	return (y * brick.height) + 120
end

function bottomY(y)
	return topY(y) + brick.height
end

local bricks = {}

local x = 1

while x <= 10 do
	local y = 1

	while y <= 18 do
		table.insert(bricks, {
			x = x,
			y = y,
			topleft = {
				x = leftX(x),
				y = topY(y)
			},
			bottomright = {
				x = rightX(x),
				y = topY(y)
			}
		}) 

		y = y + 1
	end

	x = x + 1
end

function test(x,y)
	local found = false;

	for i,brick in ipairs(bricks) do
		if x >= brick.topleft.x and x <= brick.bottomright.x then

			if y >= brick.topleft.y and y <= brick.bottomright.y then
				found = brick
			end

		end

		if found then break end
	end

	return found
end

return test