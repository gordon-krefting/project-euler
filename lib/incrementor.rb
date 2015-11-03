def incrementor(i = 1)
	while true
		yield i
		i += 1
	end
end




class Incrementor
	def initialize(start, step=1)
		@i = start
		@step = step
	end

	def each
		while true
			yield @i
			@i = @i + @step
		end
	end
end

