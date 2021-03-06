#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000,
# such that a triangle is formed.
#
# Consider the following two triangles:
#
# A(-340,495), B(-153,-910), C(835,-947)
#
# X(-175,41), Y(-421,-714), Z(574,-645)
#
# It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.
#
# Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one
# thousand "random" triangles, find the number of triangles for which the interior contains the origin.
#
# NOTE: The first two examples in the file represent the triangles in the example given above.
#
# ---------------------------------------------------------------------------------------------------------------------
# If pos x axis, neg x axis, pos y axis, neg y axis are all intersected by the edges of the triangle, the
# origin is contained.
#
require "logger"

$log = Logger.new STDOUT
$log.level = Logger::INFO
$log.datetime_format = "%Y-%m-%d %H:%M:%S%z "

# Checks a line segment for where it crosses the axes
class Result
  attr_accessor :pos_x, :pos_y, :neg_x, :neg_y

  def initialize(x1, y1, x2, y2)
    $log.debug("(#{x1}, #{y1}), (#{x2}, #{y2})")
    if x1.abs < 1 || y1.abs < 1 || x2.abs < 1 || y2.abs < 1
      $log.debug "OY"
    end
    @pos_x = false
    @pos_y = false
    @neg_x = false
    @neg_y = false

    # Line is vertical
    if (x1 == x2)
      $log.debug "Vertical"
      @pos_y = (y1 > 0) || (y2 > 0)
      @neg_y = (y1 < 0) || (y2 < 0)
      return
    end

    # check for horiz! If horiz then !cross c
    if y1 == y2
      $log.debug "Horizontal"
      @pos_x = (x1 > 0 || x2 > 0)
      @pos_y = (x1 < 0 || x2 < 0)
      return
    end

    # slope
    m = (y1 - y2) / (x1 - x2)
    $log.debug "Slope: #{m}"

    # y crossing (also known as b)
    b = y1 - m * x1
    $log.debug "Y intercept: #{b}"

    if b.abs < 10
      $log.debug "HEY"
    end

    # y crossing
    if (x1 > 0 == x2 < 0) # need opposite signs
      @pos_y = (b > 0)
      @neg_y = (b < 0)
    end

    # x crossing
    if (y1 >= 0 == y2 <= 0) # need opposite signs
      x_intercept = -1 * b / m
      $log.debug "X intercept: #{x_intercept}"
      if x_intercept.abs < 10
        $log.debug "YO"
      end
      @pos_x = (x_intercept >= 0)
      @neg_x = (x_intercept <= 0)
    end
  end

  def to_s
    return "#{@pos_x},#{@pos_y},#{@neg_x},#{@neg_y}"
  end
end

count = 0

lines = [
  #	"-340,495,-153,-910,835,-947", # true
  #	"-175,41,-421,-714,574,-645",  # false
  "316,821,-763,68,-290,-741",  # true?
  "448,617,-988,0,-103,-504", #true
#	"-2,-2,2,0,-1,1",
#	"-2,-2,2,2,-1,1"
]

#lines.each do |line|
File.readlines("../in.txt").each do |line|
  $log.debug "--------------------------------
" + line
  x1, y1, x2, y2, x3, y3 = line.split(",").map(&:to_f)
  seg1 = Result.new(x1, y1, x2, y2)
  seg2 = Result.new(x2, y2, x3, y3)
  seg3 = Result.new(x3, y3, x1, y1)
  $log.debug seg1.to_s
  $log.debug seg2.to_s
  $log.debug seg3.to_s

  contains_origin = (seg1.pos_x || seg2.pos_x || seg3.pos_x) &&
                    (seg1.pos_y || seg2.pos_y || seg3.pos_y) &&
                    (seg1.neg_x || seg2.neg_x || seg3.neg_x) &&
                    (seg1.neg_y || seg2.neg_y || seg3.neg_y)

  if contains_origin
    count += 1
  end
  $log.debug contains_origin
end

puts "Count: #{count}"
