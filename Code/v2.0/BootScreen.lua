j = 0
jsw = true
k = 0
ksw = true
cnt = 0
l = 0
lswm = false
-- Tick function that will be executed every logic tick
function onTick()
	
	cnt = cnt + 1
	
	sinva = math.abs(math.sin(math.pi * cnt / 60))
	cosva = math.abs(math.cos(math.pi * cnt / 60))

	if sinva == 1 then
		j = j + 1
		jsw = false
		ksw = true
	elseif cosva == 1 then
		k= k + 1
		jsw = true
		ksw = false
	end

	mosw = input.getBool(1)
	
	blink = input.getBool(2)
	
	if (blink and not(lswm)) or not(blink and not(lswm)) then
		l = (l + 1) % 8
		lswm = blink
	end

end

-- Draw function that will be executed when this script renders to a screen
function onDraw()
	w = screen.getWidth()				  -- Get the screen's width and height
	h = screen.getHeight()
	r = h / 4.5
	py = - h / 4.5
	
	if mosw then
				
		screen.drawCircle(w / 2, h / 2 + py, r)
		screen.drawLine(w / 2,h / 2 + py - r , w / 2, h / 2 + py + r)
		screen.drawLine(w / 2 - math.sqrt(3) / 2 * r, h / 2 + py - r / 2, w / 2 - math.sqrt(3) / 2 * r, h / 2 + py + r / 2)
		screen.drawLine(w / 2 - math.sqrt(3) / 2 * r, h / 2 + py - r / 2, w / 2, h / 2 + py + r)
		screen.drawLine(w / 2 + math.sqrt(3) / 2 * r, h / 2 + py + r / 2, w / 2, h / 2 + py - r)
		screen.drawLine(w / 2, h / 2 + py, w / 2 + math.sqrt(3) / 3 * r, h / 2 + py)

		r1 = 3
		r2 = 6	
		for i = 0, 8 do
			if i == l then
			
			else
				screen.setColor(255, 255, 255)
				screen.drawLine(w / 2 + r1 * math.cos(2 * math.pi * i / 8) ,  h * 4 / 5 + r1 * math.sin(2 * math.pi * i / 8),w / 2 + r2 * math.cos(2 * math.pi * i / 8),  h * 4 / 5 + r2 * math.sin(2 * math.pi * i / 8))
			end
		end
		screen.setColor(255, 255, 255)
		screen.drawTextBox(0, h / 2 + 5, w, 12, "welcome" , 0, -1)
		screen.drawTextBox(0, h / 2 + 5, w, 12, "naOS.System" , 0, 1)
		screen.drawTextBox(0, h - 1 - 5, w, 1 + 5, "(c)nao.k", 1, 0)
	end

end
