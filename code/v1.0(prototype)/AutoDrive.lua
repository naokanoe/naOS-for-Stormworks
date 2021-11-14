-- Tick function that will be executed every logic tick
function onTick()
	arrflag = false
	cmps = input.getNumber(1)
	gpsx = input.getNumber(2)
	gpsy = input.getNumber(3)
	wpx = input.getNumber(4)
	wpy = input.getNumber(5)

	clk = input.getNumber(6)

	dsnsr = {input.getNumber(7),input.getNumber(8),input.getNumber(9)} --F,L,R
	tlt = {r = input.getNumber(10), p = input.getNumber(11), y = cmps}

	spd = input.getNumber(12)
	alt = input.getNumber(13)

	blink = input.getBool(1)
	auto = {d = input.getBool(2), t = input.getBool(3)}

	wpa = math.atan(wpx - gpsx, wpy - gpsy) / (math.pi * 2)

	tang = wpa-cmps

	if math.abs(tang) > 0.5 then
		cmps = cmps + cmps / math.abs(cmps) * -0.5
		wpa = wpa + wpa / math.abs(wpa) * -0.5
	end

	if wpx ~= 0 and wpy ~= 0 then
		dist = math.sqrt((wpx - gpsx) ^ 2 + (wpy - gpsy) ^ 2) / 1000
	else
		dist = 0
	end
	
	angofs = {0, 0.1}
	if dsnsr[1] > 100 then
		if dsnsr[2] > 100 then
			angofs = angofs[2]
		elseif dsnsr[3] > 100 then
			angofs = -1 * angofs[2]
		end
	end

	chour = math.floor(clk * 24)
	cmin = 24 * clk % 1 * 60 - 24 * clk % 1 * 60 % 1

	artime = math.sqrt((wpx - gpsx) ^ 2 + (wpy - gpsy) ^ 2) / spd / 60

	archour = chour
	arcmin = cmin + artime
	if arcmin > 59 then
		arcmin = arcmin % 60
		archour = archour + arcmin // 60
	end
	
	if dist < 1 and (wpx ~=0 and wpy ~=0) and blink then
		arrflag = true
	end

	pidm = 10
	output.setNumber(1, cmps * pidm)
	output.setNumber(2, wpa * pidm)
	output.setBool(1, arrflag)
end

-- Draw function that will be executed when this script renders to a screen
function onDraw()

	-- Get the screen's width and height
	w = screen.getWidth()
	h = screen.getHeight()

	screen.setColor(200, 0, 0)
	screen.drawCircle(w / 2, h / 2, 2)
	screen.drawLine(w / 2, h / 2 - 6, w / 2, h / 2 - 2)
	screen.drawLine(w / 2, h / 2 + 2, w / 2, h / 2 + 6)
	screen.drawLine(w / 2 - 6, h / 2, w / 2 - 2, h / 2)
	screen.drawLine(w / 2 + 2, h / 2, w / 2 + 6, h / 2)

	screen.setColor(0, 0, 200)
	if math.abs(tang) <= 0.25 then
		screen.drawCircle(w / 2 - w / 2 * tang, h / 2, 2)
	elseif tang > 0.25 then
		screen.drawCircle(0, h / 2, 2)
	elseif tang < -0.25 then
		screen.drawCircle(w, h / 2, 2)
	end		

	if arrflag then
		screen.setColor(255, 160, 255)
		screen.drawTextBox(0, h / 2 - 16, w, 8, "arrive soon", 0, 0)
	end
	
	if auto.d then
		screen.setColor(89, 63, 255)
		screen.drawText(0, h - 30, "EST:"..string.format("%2.1f", artime).."min.")
		screen.drawText(0, h - 24, "dst:"..string.format("%2.1f", dist).."km")
	end

end
