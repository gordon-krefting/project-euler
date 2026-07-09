#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class SolveTest < Test::Unit::TestCase
  def test_roman_to_integer
    assert_equal 6, roman_to_integer("VI")
    assert_equal 16, roman_to_integer("VIIIIIIIIIII")
  end

  def test_integer_to_roman
    assert_equal "XVI", integer_to_roman(16)
  end

  # Numerals whose minimal form opens with a subtractive pair
  def test_roman_to_integer_with_leading_subtractive_pair
    assert_equal 4, roman_to_integer("IV")
    assert_equal 9, roman_to_integer("IX")
    assert_equal 40, roman_to_integer("XL")
    assert_equal 90, roman_to_integer("XC")
    assert_equal 400, roman_to_integer("CD")
    assert_equal 900, roman_to_integer("CM")
    assert_equal 440, roman_to_integer("CDXL")
    assert_equal 1994, roman_to_integer("MCMXCIV")
  end

  # Sampled at random from p089_roman.txt
  def test_roman_to_integer_against_sampled_input
    assert_equal 3376, roman_to_integer("MMMCCCLXXVI")
    assert_equal 4290, roman_to_integer("MMMMCCLXXXX")
    assert_equal 2916, roman_to_integer("MMDCCCCXVI")
    assert_equal 2782, roman_to_integer("MMDCCLXXXII")
    assert_equal 2621, roman_to_integer("MMDCXXI")
    assert_equal 2964, roman_to_integer("MMCMLXIIII")
    assert_equal 590, roman_to_integer("DLXXXX")
    assert_equal 2720, roman_to_integer("MMDCCXX")
    assert_equal 216, roman_to_integer("CCXVI")
    assert_equal 3601, roman_to_integer("MMMDCI")
  end

  # Same 10 entries, mapped to their minimal Roman numeral form
  def test_integer_to_roman_against_sampled_input
    assert_equal "MMMCCCLXXVI", integer_to_roman(3376)
    assert_equal "MMMMCCXC", integer_to_roman(4290)
    assert_equal "MMCMXVI", integer_to_roman(2916)
    assert_equal "MMDCCLXXXII", integer_to_roman(2782)
    assert_equal "MMDCXXI", integer_to_roman(2621)
    assert_equal "MMCMLXIV", integer_to_roman(2964)
    assert_equal "DXC", integer_to_roman(590)
    assert_equal "MMDCCXX", integer_to_roman(2720)
    assert_equal "CCXVI", integer_to_roman(216)
    assert_equal "MMMDCI", integer_to_roman(3601)
  end

  # Same 10 entries, mapped to the characters saved by minimizing each
  def test_minimized_roman_against_sampled_input
    assert_equal 0, minimized_roman("MMMCCCLXXVI")
    assert_equal 3, minimized_roman("MMMMCCLXXXX")
    assert_equal 3, minimized_roman("MMDCCCCXVI")
    assert_equal 0, minimized_roman("MMDCCLXXXII")
    assert_equal 0, minimized_roman("MMDCXXI")
    assert_equal 2, minimized_roman("MMCMLXIIII")
    assert_equal 3, minimized_roman("DLXXXX")
    assert_equal 0, minimized_roman("MMDCCXX")
    assert_equal 0, minimized_roman("CCXVI")
    assert_equal 0, minimized_roman("MMMDCI")
  end

  # Same 10 entries sampled at random from p089_roman.txt
  def test_characters_saved_against_sampled_input
    romans = %w[
      MMMCCCLXXVI
      MMMMCCLXXXX
      MMDCCCCXVI
      MMDCCLXXXII
      MMDCXXI
      MMCMLXIIII
      DLXXXX
      MMDCCXX
      CCXVI
      MMMDCI
    ]
    assert_equal 11, characters_saved(romans)
  end
end
