-- Tick function that will be executed every logic tick
function onTick()

	mntr = {w = input.getNumber(1), h = input.getNumber(2)}
	tch = {{f = input.getBool(1), x = input.getNumber(3), y = input.getNumber(4)}, {f = input.getBool(2), x = input.getNumber(5), y = input.getNumber(6)}}
	
	dst = {a = input.getNumber(7), d = input.getNumber(8), t = input.getNumber(9)}

	c = input.getNumber(10)
	clk = {math.floor(c * 24), 24 * c % 1 * 60 - 24 * c % 1 * 60 % 1}
	
	cmps = input.getNumber(11)
	spd = input.getNumber(12)
	aspd = input.getNumber(13)
	alt = input.getNumber(14)

	bat = input.getNumber(15)
	gene = input.getNumber(16)
	fuel = {j = {input.getNumber(17), input.getNumber(18)}, d = {input.getNumber(19), input.getNumber(20)}}
	
	wthr = {input.getNumber(21), input.getNumber(22), input.getNumber(23), input.getNumber(24), input.getNumber(25)}

	auto = {d = input.getBool(3), t = input.getBool(4)}

	blink = input.getBool(5)

end

-- Draw function that will be executed when this script renders to a screen
function onDraw()

	-- Get the screen's width and height
	w = screen.getWidth()
	h = screen.getHeight()

	screen.setColor(255, 255, 255)
	tb = blink and ":" or " "
	screen.drawText(1, 2, string.format("%02d", clk[1])..tb..string.format("%02d", clk[2]))
	
	screen.setColor(0, 200, 0)
	screen.drawRectF(w - 14, 2, bat * 10, 7)
	screen.setColor(255, 255, 255)
	screen.drawRect(w - 15, 1, 11, 7)
	screen.drawRect(w - 4, 3, 1, 3)

	screen.setColor(255, 255, 255)
	screen.drawRectF(w - 14 - 17, 2, fuel.j[2] * 10, 7)
	screen.drawRect(w - 15 - 17, 1, 11, 7)

	screen.setColor(40, 40, 55)
	screen.drawLine(0, 10, w, 10)
	
	screen.setColor(89, 63, 255)

	screen.drawText(0, h - 18, "SPD:"..string.format("%2.1f", spd * 3.6).."km/h")
	screen.drawText(0, h - 12, "A.SPD:"..string.format("%2.1f", aspd * math.pi * 2).."rad/s")
	screen.drawText(0, h - 6, "alt:"..string.format("%2.1f", alt).."m")

end