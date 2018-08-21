#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# It turns out that 12 cm is the smallest length of wire that can be bent to form an integer sided right angle triangle
# in exactly one way, but there are many more examples.
# 
# 12 cm: (3,4,5)
# 24 cm: (6,8,10)
# 30 cm: (5,12,13)
# 36 cm: (9,12,15)
# 40 cm: (8,15,17)
# 48 cm: (12,16,20)
# 
# In contrast, some lengths of wire, like 20 cm, cannot be bent to form an integer sided right angle triangle, and
# other lengths allow more than one solution to be found; for example, using 120 cm it is possible to form exactly
# three different integer sided right angle triangles.
# 
# 120 cm: (30,40,50), (20,48,52), (24,45,51)
# 
# Given that L is the length of the wire, for how many values of L ≤ 1,500,000 can exactly one integer sided right
# angle triangle be formed?
#
# ---------------------------------------------------------------------------------------------------------------------
# For generating triples from coprimes:
#   https://en.wikipedia.org/wiki/Pythagorean_triple#Generating_a_triple
#
# For generating coprimes:
#   https://en.wikipedia.org/wiki/Coprime_integers#Generating_all_coprime_pairs
#
$limit = 1500000

class PythagoreanTriple

  attr_accessor :m, :n, :perimeter

  def initialize(m,n)
    #@k = 1
    @m = m
    @n = n
    @sides = []
    @sides.push m**2 - n**2
    @sides.push 2*m*n
    @sides.push m**2 + n**2
    @sides.sort!
    @perimeter = @sides.inject(:+)
  end

  # not sure about this!
  def valid_primitive?
    # 
    return m > n && (m - n) % 2 == 1 
  end

  def get_scaled_perimeter(k)
    @sides.map {|s| s*k}.inject(:+)
  end

  def too_big?
    @perimeter > $limit
  end

  def to_s
    "#{perimeter} cm: #{@sides}"
  end

end

if __FILE__ == $0
  queue = [PythagoreanTriple.new(2,1), PythagoreanTriple.new(3,1)]

  $results = {}
  def increment_result(perimeter)
    $results.has_key?(perimeter) ? $results[perimeter] += 1 : $results[perimeter] = 1 
  end
  
  while queue.size > 0
    triple = queue.shift
    if !triple.too_big?
      if triple.valid_primitive?
        #puts triple
        increment_result(triple.perimeter)
        k = 2
        while true
          scaled_perimeter = triple.get_scaled_perimeter(k)
          if scaled_perimeter > $limit
            break
          end
          #puts scaled_perimeter
          increment_result(scaled_perimeter)
          k += 1
        end
      end
      queue.push PythagoreanTriple.new((2 * triple.m - triple.n), triple.m)
      queue.push PythagoreanTriple.new((2 * triple.m + triple.n), triple.m)
      queue.push PythagoreanTriple.new(triple.m + (2 * triple.n), triple.n)
    end
  end

  #puts $results

  puts $results.reduce(0) {|sum, (key, value)|
    if value == 1
      sum += 1
    end
    sum
  }

end

