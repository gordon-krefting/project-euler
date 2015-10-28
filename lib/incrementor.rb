def incrementor(i = 1)
	while true
		yield i
		i += 1
	end
end




class Incrementor
	def initialize(start)
		@i = start
	end

	def each
		while true
			yield @i
			@i = @i + 1
		end
	end
end

