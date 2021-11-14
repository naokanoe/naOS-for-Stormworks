cn = 0
tgt = {}
bcn = {}

function onTick()
	cn = cn + 1
	tlim = 60
	bcn = {s = input.getBool(9), p = input.getBool(10)}

	for i = 1, 20 do
		if input.getBool(12 + i) then
			rrange = rrange + 2 ^ (20 - i)
		end
	end
	
	if bcn.s then
		if bcn.p then
			table.insert(bcn, 2, cn)
		end

		if #bcn > 3 then
			bcn[1] = 50 * (bcn[2] - bcn[3]) - 250 * 5
		end
		
		if #bcn > 10 then
			table.remove(bcn)
		end
	end	
	
	for i = 1, 8 do
		j = 4 * (i - 1)
		if input.getBool(i) then
			table.insert(tgt, 1, { dr = input.getNumber(1 + j) < rrange and input.getNumber(1 + j) or rrange, d = input.getNumber(1 + j), ah = input.getNumber(2 + j) * math.pi * 2, av = input.getNumber(3 + j) * math.pi * 2, t = cn + input.getNumber(4 + j) })
			output.setBool(1, true)
		end

	end

	for i = #tgt, 1, -1 do
		if cn - tgt[i].t > tlim then
			table.remove(tgt, i)
		end
	end

end

function onDraw()
	w = screen.getWidth()
	h = screen.getHeight()
	r = h / 2 - 5
	
	if #tgt > 0 then
		for i = 1, #tgt do
			tx = - r * tgt[i].dr / rrange * math.sin(-tgt[i].ah) + w / 2
			ty = - r * tgt[i].dr / rrange * math.cos(-tgt[i].ah) + h / 2

			screen.setColor(255, 0, 0)
			screen.drawCircleF(tx, ty, 2)
		

			screen.setColor(255, 128, 64)
			screen.drawText(tx + 3, ty, string.format("%4.0f", tgt[i].d).."m")
		end
	end

	if bcn.s and #bcn > 2 then
		if bcn[1] > 10000 then
			screen.drawText(5, 0, "b:"..string.format("%2.1f", bcn[1]).."km")
		else
			screen.drawText(5, 0, "b:"..bcn[1].."m")
		end
	end
end