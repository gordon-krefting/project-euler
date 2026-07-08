
def nth_digit(i, n)
	l = Math.log(i,10).to_i + 1
	return (i / (10 ** (l-n))) % (10)
end