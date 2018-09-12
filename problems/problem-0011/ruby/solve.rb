#!/usr/bin/env ruby

$grid = Array.new
File.readlines("../in.txt").each do |line|
  $grid.push line.strip.split(/ /).collect { |s| s.to_i }
end

def across(row, col)
  if (col >= $grid.length - 3)
    return 0
  end
  $grid[row][col] * $grid[row][col + 1] * $grid[row][col + 2] * $grid[row][col + 3]
end

def down(row, col)
  if (row >= $grid.length - 3)
    return 0
  end
  $grid[row][col] * $grid[row + 1][col] * $grid[row + 2][col] * $grid[row + 3][col]
end

def diagonal(row, col)
  if (row >= $grid.length - 3 || col >= $grid.length - 3)
    return 0
  end
  $grid[row][col] * $grid[row + 1][col + 1] * $grid[row + 2][col + 2] * $grid[row + 3][col + 3]
end

def the_other_diagonal(row, col)
  if (row >= $grid.length - 3 || col < 0)
    return 0
  end
  $grid[row][col] * $grid[row + 1][col - 1] * $grid[row + 2][col - 2] * $grid[row + 3][col - 3]
end

values = Array.new
for row in 0..$grid.length - 1
  for col in 0..$grid[row].length - 1
    values.push across row, col
    values.push down row, col
    values.push diagonal row, col
    values.push the_other_diagonal row, col
  end
end

puts values.max
