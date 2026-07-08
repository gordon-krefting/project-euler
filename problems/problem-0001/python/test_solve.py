#!/usr/bin/env python3

import unittest

from solve import fizz_buzz


class TestSolve(unittest.TestCase):
    def test_fizz_buzz(self):
        self.assertEqual(23, fizz_buzz(10))
        self.assertEqual(233168, fizz_buzz(1000))


if __name__ == "__main__":
    unittest.main()
