package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

var RomanValues = map[byte]int{
	'I': 1,
	'V': 5,
	'X': 10,
	'L': 50,
	'C': 100,
	'D': 500,
	'M': 1000,
}

var IntegerValues = []struct {
	Value   int
	Numeral string
}{
	{1000, "M"},
	{900, "CM"},
	{500, "D"},
	{400, "CD"},
	{100, "C"},
	{90, "XC"},
	{50, "L"},
	{40, "XL"},
	{10, "X"},
	{9, "IX"},
	{5, "V"},
	{4, "IV"},
	{1, "I"},
}

func main() {
	file, err := os.Open("../p089_roman.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()

	var romans []string
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		romans = append(romans, scanner.Text())
	}
	if err := scanner.Err(); err != nil {
		panic(err)
	}

	fmt.Println(CharactersSaved(romans))
}

func RomanToInteger(roman string) int {
	result := 0
	for i := 0; i < len(roman); i++ {
		if i == len(roman)-1 || RomanValues[roman[i]] >= RomanValues[roman[i+1]] {
			result += RomanValues[roman[i]]
		} else {
			result -= RomanValues[roman[i]]
		}
	}
	return result
}

func IntegerToRoman(value int) string {
	var result strings.Builder
	for _, iv := range IntegerValues {
		count, remainder := value/iv.Value, value%iv.Value
		result.WriteString(strings.Repeat(iv.Numeral, count))
		value = remainder
	}

	return result.String()
}

func MinimizedRoman(roman string) int {
	return len(roman) - len(IntegerToRoman(RomanToInteger(roman)))
}

func CharactersSaved(romans []string) int {
	sum := 0
	for _, roman := range romans {
		sum += MinimizedRoman(roman)
	}
	return sum
}
