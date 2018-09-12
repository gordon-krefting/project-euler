// Brute force turned out to be fast enough...
package main

import "fmt"
import "errors"

func main() {
	for n := 1; n < 1000000000; n++ {
		rev, err := Reverse(n)
		if err == nil && AllDigitsOdd(n+rev) {
			fmt.Println(n)
		}
	}
}

// AllDigitsOdd returns true if every digit of the input is odd.
func AllDigitsOdd(n int) bool {
	if n == 0 {
		return false
	}

	for n > 0 {
		rem := n % 10
		if rem%2 == 0 {
			return false
		}
		n /= 10

	}
	return true
}

// Reverse reverses the digits of an integer. Returns am error if the number can't be reversed
// (ends with a 0 is the only failure case I can think of)
func Reverse(n int) (int, error) {
	if n == 0 {
		return 0, errors.New("0 can't be reversed")
	}
	newN := 0
	for n > 0 {
		rem := n % 10
		// A special case here... if the last digit is 0 we fail
		if newN == 0 && rem == 0 {
			return 0, errors.New("n ends with a 0")
		}
		newN *= 10
		newN += rem
		n /= 10
	}
	return newN, nil
}
