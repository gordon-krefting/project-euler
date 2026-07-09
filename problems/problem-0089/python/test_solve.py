#!/usr/bin/env python3

import unittest

from solve import characters_saved, integer_to_roman, roman_to_integer


class TestSolve(unittest.TestCase):
    def test_roman_to_integer(self):
        self.assertEqual(16, roman_to_integer("VIIIIIIIIIII"))

    def test_integer_to_roman(self):
        self.assertEqual("XVI", integer_to_roman(16))

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
