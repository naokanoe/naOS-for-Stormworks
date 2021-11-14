function onTick()
--positive integer number to 20 bit binary
--if negative, to convert positive
--if number is over 2^21(=2097152), to hold down 2^21-1(=2097151)
	value = input.getNumber(1) >= 2 ^ 21 and 2 ^ 21 - 1 or math.floor(math.abs(input.getNumber(1)))
	nbt = {}
	fbt = {}

	repeat
		table.insert(nbt, 1, string.format("%1d", value % 2))
		table.insert(fbt, 1, value % 2 == 1 and true or false)
		value = value // 2
	until value < 1
	
	for i = 1, #fbt do
		output.setBool(19 - (i + #fbt), fbt[i])
	end
end

function onDraw()
	w = screen.getWidth()
	h = screen.getHeight()					
	screen.setColor(0, 255, 0)

	--use in debug	
	for i = 1, #nbt do
		screen.drawText(5 * (i - 1), 0, nbt[i])
	end
	for i = 1, #fbt do
		screen.drawText(5 * (i - 1), 6, fbt[i] and "T" or "F")
	end
end
