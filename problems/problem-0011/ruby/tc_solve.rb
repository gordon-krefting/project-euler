#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase
  def test_grid_loads_correctly
    assert_equal 20, GRID.length
    assert_equal 20, GRID[0].length
    assert_equal 8, GRID[0][0]
    assert_equal 48, GRID[19][19]
  end

  # Straight from the problem statement's own worked example.
  def test_diagonal_against_known_example
    assert_equal 1_788_696, diagonal(6, 8)
  end

  def test_across_returns_zero_past_right_edge
    assert_equal 0, across(0, GRID.length - 1)
  end

  def test_down_returns_zero_past_bottom_edge
    assert_equal 0, down(GRID.length - 1, 0)
  end

  def test_diagonal_returns_zero_past_edge
    assert_equal 0, diagonal(GRID.length - 1, GRID.length - 1)
  end

  # Regression: with col in 0..2, col - 3 goes negative, and Ruby's negative
  # array indexing would silently wrap around to the end of the row instead
  # of raising -- so this has to be guarded explicitly rather than relying on
  # an out-of-bounds check.
  def test_anti_diagonal_returns_zero_near_left_edge
    assert_equal 0, anti_diagonal(3, 0)
    assert_equal 0, anti_diagonal(3, 1)
    assert_equal 0, anti_diagonal(3, 2)
  end

  def test_solution
    values = []
    GRID.each_index do |row|
      GRID[row].each_index do |col|
        values.push across(row, col)
        values.push down(row, col)
        values.push diagonal(row, col)
        values.push anti_diagonal(row, col)
      end
    end

    assert_equal 70_600_674, values.max
  end
end
