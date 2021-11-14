leftspoil = 0
rightspoil = 0
centerspoil = 0
-- Tick function that will be executed every logic tick
function onTick()
	angleout = input.getNumber(1)
	ctrlout = input.getNumber(2)
	
	if ctrlout > 0 then
		if angleout == 0 then
			leftspoil = 1 - ctrlout
			rightspoil = 1 - ctrlout
		elseif angleout > 0 then
			leftspoil = 1 - ctrlout
			rightspoil = 1 - ctrlout + math.abs(angleout)
		elseif angleout < 0 then
			leftspoil = 1 - ctrlout + math.abs(angleout)
			rightspoil = 1 - ctrlout
		else

		end

		centerspoil = 1 - ctrlout

	else
		leftspoil = 1
		rightspoil = 1

		centerspoil = 1
	end

	output.setNumber(1, leftspoil)
	output.setNumber(2, centerspoil)
	output.setNumber(3, rightspoil)
end

-- Draw function that will be executed when this script renders to a screen
function onDraw()
	w = screen.getWidth()
	h = screen.getHeight()					
end