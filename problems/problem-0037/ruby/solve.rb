#!/usr/bin/env ruby
# Truncatable primes
# Problem 37

# Builds up its known-prime cache incrementally, so it only behaves correctly
# when queried for ascending values of num (as the solve loop below does).
class PrimeCache
  def initialize
    @known = { 2 => true, 3 => true }
    @ordered = [2, 3]
    @max_checked = 0
  end

  def prime?(num)
    return @known.key?(num) if num <= @max_checked

    @max_checked = num
    limit = num**0.5
    @ordered.each do |p|
      if p > limit
        @known[num] = true
        @ordered.push(num)
        return true
      end
      return false if (num % p).zero?
    end
  end
end

PRIMES = PrimeCache.new

def truncate_left(num)
  num % (10**Math.log(num, 10).floor)
end

def truncate_right(num)
  num / 10
end

def check_left(num)
  return PRIMES.prime?(num) if num < 10

  PRIMES.prime?(num) && check_left(truncate_left(num))
end

def check_right(num)
  return PRIMES.prime?(num) if num < 10

  PRIMES.prime?(num) && check_right(truncate_right(num))
end

def truncatable_prime?(num)
  return false unless PRIMES.prime?(num)
  return false if num < 10

  check_left(num) && check_right(num)
end

if __FILE__ == $PROGRAM_NAME
  total = 0
  (3..999_999).each do |num|
    total += num if truncatable_prime?(num)
  end

  puts "Total: #{total}"
end
