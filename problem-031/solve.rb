#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Coin sums
# Problem 31
# In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
# 
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:
# 
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
#
# ---------------------------------------------------------------------------------------------------------------------
# There must be a nify recursive algorithm here... but I can't figure it out! There must be a solution with some 
# better looping....
#

require_relative "../lib/incrementor.rb"
require "logger"

$log = Logger.new STDOUT
$log.level = Logger::INFO
$log.datetime_format = '%Y-%m-%d %H:%M:%S%z '


coin_values = [200, 100, 50, 20, 10, 5, 2, 1]


def total(p200, p100, p50, p20, p10,p5,p2,p1)
	t = 200*p200 + 100*p100 + 50*p50 + 20*p20 + 10*p10 + 5*p5 + 2*p2 + p1
	return t
end

count = 0

Incrementor.new(0).each do |p200|
	if total(p200,0,0,0,0,0,0,0) > 200
		break
	end
	Incrementor.new(0).each do |p100|
		if total(p200,p100,0,0,0,0,0,0) > 200
			break
		end
		Incrementor.new(0).each do |p50|
			if total(p200,p100,p50,0,0,0,0,0) > 200
				break
			end
			Incrementor.new(0).each do |p20|
				if total(p200,p100,p50,p20,0,0,0,0) > 200
					break
				end
				Incrementor.new(0).each do |p10|
					if total(p200,p100,p50,p20,p10,0,0,0) > 200
						break
					end
					Incrementor.new(0).each do |p5|
						if total(p200,p100,p50,p20,p10,p5,0,0) > 200
							break
						end
						Incrementor.new(0).each do |p2|
							if total(p200,p100,p50,p20,p10,p5,p2,0) > 200
								break
							end
							Incrementor.new(0).each do |p1|
								t = total(p200,p100,p50,p20,p10,p5,p2,p1)
								if t == 200
									$log.debug "#{p200}x200p + #{p100}x100p + #{p50}x50p + #{p20}x20p + #{p10}x10p + #{p5}x5p + #{p2}x2p + #{p1}x1p = #{t}"
									count += 1
									break
								end
							end
						end
					end
				end
			end
		end
	end
end

puts "Count:#{count}"


