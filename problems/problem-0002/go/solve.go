package main

import "fmt"

func main() {
	a, b := 1, 1
	sum := 0
	limit := 4000000

	for b < limit {
		t := a + b
		a = b
		b = t
		if a%2 == 0 {
			sum += a
		}
	}
	fmt.Println(sum)
}
