#!/usr/bin/env ruby

# sum the results of an operation
puts (1..10).reduce(0) {|sum, n|
  sum += n*3
}

# sum the contents of an array
puts (1..10).map {|n|
  n*3
}.reduce(:+)


# make a hash from a loop. (In this case, a lookup of digits to their factorials)
puts (0..9).each_with_object({}) { |n, map|
  map[n] = n==0 ? 1 : n * map[n-1]
}

# Reduce a map
# In this case, we're counting all the entries where the val is 1
results = { 'x' => 1, 'y' => 2, 'z' => 1}
puts results.reduce(0) {|sum, (key, value)|
  if value == 1
    sum += 1
  end
  sum
}

# Find in array (reverse!)
[4,3,1,1,1].rindex {|i|
  i > 1
}