#!/usr/bin/python3

ROMAN_VALUES = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
}

INTEGER_VALUES = {
    1000: "M",
    900: "CM",
    500: "D",
    400: "CD",
    100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
    9: "IX",
    5: "V",
    4: "IV",
    1: "I",
}


def roman_to_integer(roman):
    o = 0
    for i in range(len(roman)):
        if i == len(roman) - 1 or ROMAN_VALUES[roman[i]] >= ROMAN_VALUES[roman[i + 1]]:
            o += ROMAN_VALUES[roman[i]]
        else:
            o -= ROMAN_VALUES[roman[i]]
    return o


def integer_to_roman(integer_value):
    o = ""
    for value, numeral in INTEGER_VALUES.items():
        count, remainder = divmod(integer_value, value)
        o += numeral * count
        integer_value = remainder
    return o


def minimized_roman(roman):
    return len(roman) - len(integer_to_roman(roman_to_integer(roman)))

def characters_saved(romans):
    return sum(minimized_roman(roman) for roman in romans)

if __name__ == "__main__":
    with open("../p089_roman.txt") as f:
        romans = [line.strip() for line in f]
    print(characters_saved(romans))
