def incrementor(i = 1)
	while true
		yield i
		i += 1
	end
end