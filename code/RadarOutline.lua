cn = 0

function onTick()
	cn = cn + 1
	ang = input.getNumber(21) * math.pi * 2
	cmps = input.getNumber(22) * math.pi * 2
	rlf = property.getBool("Radar search Range Manual SW")
end

function onDraw()
	w = screen.getWidth()
	h = screen.getHeight()
	r = h / 2 - 5

	rx = - r * math.sin(-ang) + w / 2
	ry = - r * math.cos(-ang) + h / 2
	
	screen.setColor(0, 255, 0)
	screen.drawCircleF(w / 2, h / 2, 2)
	screen.drawCircle(w / 2, h / 2, r)

	screen.drawLine(w / 2, h / 2, rx, ry)
end