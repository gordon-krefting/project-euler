#!/usr/bin/python3
# Goldbach's other conjecture
# Problem 46
# Stub -- see the Ruby solution in ../ruby/solve.rb for a working reference.


def is_prime(n):
    raise NotImplementedError


def conjecture(n):
    raise NotImplementedError


if __name__ == "__main__":
    n = 5
    while conjecture(n) or is_prime(n):
        n += 2
    print(n)
