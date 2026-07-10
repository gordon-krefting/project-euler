#!/usr/bin/env python3

import unittest

from solve import (
    characters_saved,
    integer_to_roman,
    minimized_roman,
    roman_to_integer,
)


class TestSolve(unittest.TestCase):
    def test_roman_to_integer(self):
        self.assertEqual(6, roman_to_integer("VI"))
        self.assertEqual(16, roman_to_integer("VIIIIIIIIIII"))

    def test_integer_to_roman(self):
        self.assertEqual("XVI", integer_to_roman(16))

    def test_roman_to_integer_with_leading_subtractive_pair(self):
        # Numerals whose minimal form opens with a subtractive pair
        cases = [
            ("IV", 4),
            ("IX", 9),
            ("XL", 40),
            ("XC", 90),
            ("CD", 400),
            ("CM", 900),
            ("CDXL", 440),
            ("MCMXCIV", 1994),
        ]
        for roman, expected in cases:
            with self.subTest(roman=roman):
                self.assertEqual(expected, roman_to_integer(roman))

    def test_roman_to_integer_against_sampled_input(self):
        # Sampled at random from p089_roman.txt
        cases = [
            ("MMMCCCLXXVI", 3376),
            ("MMMMCCLXXXX", 4290),
            ("MMDCCCCXVI", 2916),
            ("MMDCCLXXXII", 2782),
            ("MMDCXXI", 2621),
            ("MMCMLXIIII", 2964),
            ("DLXXXX", 590),
            ("MMDCCXX", 2720),
            ("CCXVI", 216),
            ("MMMDCI", 3601),
        ]
        for roman, expected in cases:
            with self.subTest(roman=roman):
                self.assertEqual(expected, roman_to_integer(roman))

    def test_integer_to_roman_against_sampled_input(self):
        # Same 10 entries, mapped to their minimal Roman numeral form
        cases = [
            (3376, "MMMCCCLXXVI"),
            (4290, "MMMMCCXC"),
            (2916, "MMCMXVI"),
            (2782, "MMDCCLXXXII"),
            (2621, "MMDCXXI"),
            (2964, "MMCMLXIV"),
            (590, "DXC"),
            (2720, "MMDCCXX"),
            (216, "CCXVI"),
            (3601, "MMMDCI"),
        ]
        for value, expected in cases:
            with self.subTest(value=value):
                self.assertEqual(expected, integer_to_roman(value))

    def test_minimized_roman_against_sampled_input(self):
        # Same 10 entries, mapped to the characters saved by minimizing each
        cases = [
            ("MMMCCCLXXVI", 0),
            ("MMMMCCLXXXX", 3),
            ("MMDCCCCXVI", 3),
            ("MMDCCLXXXII", 0),
            ("MMDCXXI", 0),
            ("MMCMLXIIII", 2),
            ("DLXXXX", 3),
            ("MMDCCXX", 0),
            ("CCXVI", 0),
            ("MMMDCI", 0),
        ]
        for roman, expected in cases:
            with self.subTest(roman=roman):
                self.assertEqual(expected, minimized_roman(roman))

    def test_characters_saved_against_sampled_input(self):
        # Same 10 entries sampled at random from p089_roman.txt
        romans = [
            "MMMCCCLXXVI",
            "MMMMCCLXXXX",
            "MMDCCCCXVI",
            "MMDCCLXXXII",
            "MMDCXXI",
            "MMCMLXIIII",
            "DLXXXX",
            "MMDCCXX",
            "CCXVI",
            "MMMDCI",
        ]
        self.assertEqual(11, characters_saved(romans))


if __name__ == "__main__":
    unittest.main()
