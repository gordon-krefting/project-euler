package main

// Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0, where each “_” is a single digit.

import (
	"fmt"
	"math"
	"regexp"
	"strconv"
)

var foo = 12
var r, _ = regexp.Compile("1.2.3.4.5.6.7.8.9.0")

func isMatch(s string) bool {
	return r.MatchString(s)
}

func main() {
	//               1_2_3_4_5_6_7_8_9_0
	minSq := float64(1020304050607080900)
	maxSq := float64(1929394959697989990)

	min := int(math.Sqrt(minSq))
	max := int(math.Sqrt(maxSq))

	var sq int
	for i := min; i <= max; i += 10 {
		sq = i * i
		if isMatch(strconv.Itoa(sq)) {
			fmt.Println(strconv.Itoa(i))
			break
		}
	}

}
