#!/usr/bin/env python3

import unittest

from solve import is_prime, is_truncatable_prime, truncate_left, truncate_right

# The only eleven truncatable primes (per the problem statement's guarantee),
# summing to the known answer of 748317.
TRUNCATABLE_PRIMES = [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]


class TestSolve(unittest.TestCase):
    def test_truncate_left(self):
        self.assertEqual(797, truncate_left(3797))
        self.assertEqual(97, truncate_left(797))
        self.assertEqual(7, truncate_left(97))

    def test_truncate_right(self):
        self.assertEqual(379, truncate_right(3797))
        self.assertEqual(37, truncate_right(379))
        self.assertEqual(3, truncate_right(37))

    def test_is_prime(self):
        self.assertTrue(is_prime(2))
        self.assertTrue(is_prime(3797))
        self.assertFalse(is_prime(1))
        self.assertFalse(is_prime(3796))

    def test_single_digit_primes_are_not_truncatable(self):
        # NOTE in the problem statement: 2, 3, 5, and 7 don't count.
        for n in (2, 3, 5, 7):
            with self.subTest(n=n):
                self.assertFalse(is_truncatable_prime(n))

    def test_is_truncatable_prime_against_known_examples(self):
        for n in TRUNCATABLE_PRIMES:
            with self.subTest(n=n):
                self.assertTrue(is_truncatable_prime(n))

    def test_is_truncatable_prime_rejects_non_examples(self):
        # 41 is prime but 4 isn't; 9 isn't prime at all.
        for n in (41, 9):
            with self.subTest(n=n):
                self.assertFalse(is_truncatable_prime(n))

    def test_sum_of_known_truncatable_primes(self):
        self.assertEqual(748_317, sum(TRUNCATABLE_PRIMES))


if __name__ == "__main__":
    unittest.main()
