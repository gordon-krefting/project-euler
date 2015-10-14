#!/usr/bin/env ruby

# A permutation is an ordered arrangement of objects. For example, 3124 is one possible
# permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically
# or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
# 
# Me: there are 10! = 3628800 combinations
#
# 1 2
# 2 1
#
# 1 2 3
# 1 3 2
# 2 1 3
# 2 3 1
# 3 1 2
# 3 2 1
#
# 1 2 3 4
# 1 2 4 3
# 1 3 2 4
# 1 3 4 2
# 1 4 2 3
# 1 4 3 2

# 2 1 3 4
# 2 1 4 3
# 2 3 1 4
# 2 3 4 1
# 2 4 1 2
# 2 4 2 1
