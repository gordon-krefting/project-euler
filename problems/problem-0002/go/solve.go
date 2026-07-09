package main

import "fmt"

func main() {
	fmt.Println(EvenFibonacciSum(4000000))
}

func EvenFibonacciSum(limit int) int {
	a, b := 1, 1
	sum := 0

	for b < limit {
		t := a + b
		a = b
		b = t
		if a%2 == 0 {
			sum += a
		}
	}
	return sum
}
