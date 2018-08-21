#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Magic 5-gon ring
# Problem 68
# Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6, and each line adding to nine.
# 
#    https://projecteuler.net/project/images/p068_1.gif
# 
# Working clockwise, and starting from the group of three with the numerically lowest external node (4,3,2 in this
# example), each solution can be described uniquely. For example, the above solution can be described by the set:
#      4,3,2; 6,2,1; 5,1,3.
# 
# It is possible to complete the ring with four different totals: 9, 10, 11, and 12. There are eight solutions
# in total.
# 
# Total	Solution Set
#  9   4,2,3; 5,3,1; 6,1,2
#  9   4,3,2; 6,2,1; 5,1,3
#  10  2,3,5; 4,5,1; 6,1,3
#  10  2,5,3; 6,3,1; 4,1,5
#  11  1,4,6; 3,6,2; 5,2,4
#  11  1,6,4; 5,4,2; 3,2,6
#  12  1,5,6; 2,6,4; 3,4,5
#  12  1,6,5; 3,5,4; 2,4,6
#
# By concatenating each group it is possible to form 9-digit strings; the maximum string for a 3-gon ring is 432621513.
# 
# Using the numbers 1 to 10, and depending on arrangements, it is possible to form 16- and 17-digit strings.
# What is the maximum 16-digit string for a "magic" 5-gon ring?
# 
# https://projecteuler.net/project/images/p068_2.gif
#
# ---------------------------------------------------------------------------------------------------------------------

class NGonRing
  class Group
    attr_accessor :values
    def initialize(values)
      @values = values
    end
    def sum
      @values.inject(:+)
    end
    def concat
      @values.join("")
    end
    def to_s
      @values.join(",")
    end
  end

  def initialize(values)
    @groups = []

    # First group is special, just the first 3 numbers
    @groups.push Group.new([values[0], values[1], values[2]])

    size = values.length / 2
    (1..size-2).each {|i|
      o = i*2 + 1
      @groups.push Group.new([values[o], values[o-1], values[o+1]])
    }
    # Last group is special too
    @groups.push Group.new([values[(size-1)*2 + 1], values[(size-1)*2], values[1]])
  end

  # it's "best" if the first groups first number is lower than any of the other groups' first
  def is_best_permutation
    @groups[0].values[0] == @groups.min_by{|group| group.values[0]}.values[0]
  end

  def is_magic
    @groups.map{|group| group.sum}.uniq.length == 1
  end

  def concat
    @groups.map{|group| group.concat}.join("")
  end

  def to_s
    @groups.join("; ")
  end
end

if __FILE__ == $0
  values = [1,2,3,4,5,6,7,8,9,10]
  #values = [1,2,3,4,5,6]
  puts values.permutation.map {|p|
    ngon = NGonRing.new(p)
    if !ngon.is_best_permutation
      next
    end
    if ngon.is_magic
      puts ngon
      ngon
    end
  }.compact.map{|p| p.concat}.select{|s| s.length==16}.sort.reverse[0]

end





