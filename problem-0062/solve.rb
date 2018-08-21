#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3).
# In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
# 
# Find the smallest cube for which exactly five permutations of its digits are cube.
#
# ---------------------------------------------------------------------------------------------------------------------
require "../lib/incrementor"

def make_key(n)
  n.to_s.split("").sort.join
end

if __FILE__ == $0


  # We'll store each cube in a hash of arrays: keyed by 'minimum permutation' (string of sorted digits). When one of
  # the arrays has 5 elements we're done

  hash = Hash.new()

  Incrementor.new(300).each {|n|
    cube = n ** 3

    key = make_key(cube)

    if !hash.has_key?(key)
      hash[key] = []
    end

    hash[key].push cube

    if hash[key].length == 5
      puts hash[key].inspect
      exit
    end


    if cube > 100_000_000_000_000
      break
    end
  }


end