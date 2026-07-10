#!/usr/bin/env ruby
# Goldbach's other conjecture
# Problem 46
#
# Note: this solution builds up the prime list as it's checking the conjecture, so we've got to
# start searching at 3

# rubocop:disable Style/MutableConstant -- grown via push as primes are discovered
PRIMES = [2, 3]
# rubocop:enable Style/MutableConstant

def prime?(num)
  limit = num**0.5
  PRIMES.each do |p|
    if p > limit
      PRIMES.push num
      return true
    end
    return false if (num % p).zero?
  end
end

def conjecture?(num)
  limit = num**0.5
  (1..limit).each do |i|
    rem = num - (2 * (i**2))
    return true if PRIMES.include?(rem)
  end
  false
end

if __FILE__ == $PROGRAM_NAME
  (5..100_001).step(2) do |num|
    if !prime?(num) && !conjecture?(num)
      puts num
      exit
    end
  end

  puts "Didn't find it"
end
