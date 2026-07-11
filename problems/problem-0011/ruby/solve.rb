#!/usr/bin/env ruby
# Largest product in a grid
# Problem 11

GRID = File.readlines("../in.txt").map { |line| line.split.map(&:to_i) }

def across(row, col)
  return 0 if col >= GRID.length - 3

  GRID[row][col] * GRID[row][col + 1] * GRID[row][col + 2] * GRID[row][col + 3]
end

def down(row, col)
  return 0 if row >= GRID.length - 3

  GRID[row][col] * GRID[row + 1][col] * GRID[row + 2][col] * GRID[row + 3][col]
end

def diagonal(row, col)
  return 0 if row >= GRID.length - 3 || col >= GRID.length - 3

  GRID[row][col] * GRID[row + 1][col + 1] * GRID[row + 2][col + 2] * GRID[row + 3][col + 3]
end

def anti_diagonal(row, col)
  return 0 if row >= GRID.length - 3 || col < 3

  GRID[row][col] * GRID[row + 1][col - 1] * GRID[row + 2][col - 2] * GRID[row + 3][col - 3]
end

if __FILE__ == $PROGRAM_NAME
  values = []
  GRID.each_index do |row|
    GRID[row].each_index do |col|
      values.push across(row, col)
      values.push down(row, col)
      values.push diagonal(row, col)
      values.push anti_diagonal(row, col)
    end
  end

  puts values.max
end
