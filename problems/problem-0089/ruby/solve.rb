#!/usr/bin/env ruby
#
# Roman numerals
# Problem 89
#
# For a number written in Roman numerals to be considered valid there are
# basic rules which must be followed. Even though the rules allow some
# numbers to be expressed in more than one way there is always a "best" way
# of writing a particular number.
#
# The file p089_roman.txt contains one thousand numbers written in valid,
# but not necessarily minimal, Roman numerals.
#
# Find the number of characters saved by writing each of these in their
# minimal form.

ROMAN_VALUES = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000
}.freeze

INTEGER_VALUES = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}.freeze

def roman_to_integer(roman)
  o = 0
  (0...roman.length).each do |i|
    if i == roman.length - 1 || ROMAN_VALUES[roman[i]] >= ROMAN_VALUES[roman[i + 1]]
      o += ROMAN_VALUES[roman[i]]
    else
      o -= ROMAN_VALUES[roman[i]]
    end
  end
  o
end

def integer_to_roman(integer_value)
  o = ""
  INTEGER_VALUES.each do |value, numeral|
    count, remainder = integer_value.divmod(value)
    o += numeral * count
    integer_value = remainder
  end
  o
end

def minimized_roman(roman)
  roman.length - integer_to_roman(roman_to_integer(roman)).length
end

def characters_saved(romans)
  romans.sum { |roman| minimized_roman(roman) }
end

if __FILE__ == $PROGRAM_NAME
  romans = File.readlines("../p089_roman.txt").map(&:strip)
  puts characters_saved(romans)
end
