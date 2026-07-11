#!/usr/bin/python3
# Truncatable primes
# Problem 37


def is_prime(n):
    if n < 2:
        return False
    if n < 4:
        return True
    if n % 2 == 0:
        return False
    for divisor in range(3, int(n**0.5) + 1, 2):
        if n % divisor == 0:
            return False
    return True


def truncate_left(n):
    return int(str(n)[1:])


def truncate_right(n):
    return n // 10


def is_truncatable_prime(n):
    if n < 10 or not is_prime(n):
        return False

    left = n
    while left >= 10:
        left = truncate_left(left)
        if not is_prime(left):
            return False

    right = n
    while right >= 10:
        right = truncate_right(right)
        if not is_prime(right):
            return False

    return True


if __name__ == "__main__":
    total = sum(n for n in range(3, 1_000_000) if is_truncatable_prime(n))
    print(total)
