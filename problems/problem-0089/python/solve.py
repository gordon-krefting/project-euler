#!/usr/bin/python3
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
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}


def roman_to_integer(roman):
    # TODO: sum the numeral's symbol values, accounting for subtractive pairs
    pass


def integer_to_roman(value):
    # TODO: render `value` as its minimal Roman numeral representation
    pass


def characters_saved(romans):
    # TODO: sum the difference in length between each numeral and its minimal form
    pass


if __name__ == "__main__":
    with open("../p089_roman.txt") as f:
        romans = [line.strip() for line in f]
    print(characters_saved(romans))
