#!/usr/bin/python3
# Truncatable primes
# Problem 37
# Stub -- see the Ruby solution in ../ruby/solve.rb for a working reference.


def is_prime(n):
    raise NotImplementedError


def truncate_left(n):
    raise NotImplementedError


def truncate_right(n):
    raise NotImplementedError


def is_truncatable_prime(n):
    raise NotImplementedError


if __name__ == "__main__":
    total = sum(n for n in range(3, 1_000_000) if is_truncatable_prime(n))
    print(total)
