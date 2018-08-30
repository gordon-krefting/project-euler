#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Consider quadratic Diophantine equations of the form:
# 
# x² – Dy² = 1
# 
# For example, when D=13, the minimal solution in x is 649² – 13×180² = 1.
# 
# It can be assumed that there are no solutions in positive integers when D is square.
# 
# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:
# 
# 3² – 2×2² = 1
# 2² – 3×1² = 1
# 9² – 5×4² = 1
# 5² – 6×2² = 1
# 8² – 7×3² = 1
# 
# Hence, by considering minimal solutions in x for D ≤ 7, the largest x is obtained when D=5.
# 
# Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.
#
# ---------------------------------------------------------------------------------------------------------------------
#
# These are colectively called Pell's Equation:
#
#  https://en.wikipedia.org/wiki/Pell%27s_equation
#
# If you look at the series of x/y that are the sequence of convergents for the square root of D, eventually one of
# them will match: x² − Dy² = 1. That x is the one we're talking about.
#
require "set"
require_relative "../lib/incrementor"

class Square_Root_Expander

  def build_term_sequence(n, offset, denom, used_values)
    a = ((Math.sqrt(n) + offset.to_f) / denom.to_f).floor
    @term_sequence.push(a)

    new_offset = (offset - a * denom) * -1
    new_denom = (n - new_offset ** 2) / denom

    key = "#{new_offset}|#{new_denom}"
    if used_values.include? key
      return
    end

    used_values.add key

    build_term_sequence(n,new_offset,new_denom,used_values)
  end

  def get_a(n)
    1
  end

  def get_b(n)
    #puts n
    if n < @term_sequence.length
      @term_sequence[n]
    else
      @term_sequence[(n-1) % (@term_sequence.length-1) + 1]
    end
  end

  def initialize(n)
    @term_sequence = []
    build_term_sequence(n,0,1,Set.new)
    #puts @term_sequence.inspect
  end

  def get_fractions
    @A = [] # numerators
    @B = [] # denominators
    Incrementor.new(0).each {|n|
      if n==0
        @A[0] = get_b(0)
        @B[0] = 1
      elsif n==1
        @A[1] = get_b(1) * get_b(0) + get_a(1)
        @B[1] = get_b(1)
      else
        @A[n] = get_b(n) * @A[n-1] + get_a(n) * @A[n-2]
        @B[n] = get_b(n) * @B[n-1] + get_a(n) * @B[n-2]
      end
      yield @A[n], @B[n]
    }
  end
end


if __FILE__ == $0

  max_x = 0

  (2..1000).each {|n|
    if Math.sqrt(n).floor ** 2 == n
      next
    end

#    puts "------\n#{n}"

    exp = Square_Root_Expander.new(n)
    exp.get_fractions{|x,y|
      r = x**2 - n*y**2
      if r==1
#        puts "#{x} / #{y}: #{r}"
        if x > max_x
          max_x = x
          puts "#{n}: #{x}"
        end
        break
      end
    }

  }
end