#!/usr/bin/env ruby



# sum the results of an operation
puts (1..10).reduce(0) {|sum, n|
  sum += n*3
}

# sum the contents of an array
puts (1..10).map {|n|
  n*3
}.reduce(:+)