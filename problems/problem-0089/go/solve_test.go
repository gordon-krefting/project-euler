package main

import "testing"

func TestRomanToInteger(t *testing.T) {
	if RomanToInteger("VI") != 6 {
		t.Error(`RomanToInteger("VI") != 6`)
	}
	if RomanToInteger("VIIIIIIIIIII") != 16 {
		t.Error(`RomanToInteger("VIIIIIIIIIII") != 16`)
	}
}

func TestIntegerToRoman(t *testing.T) {
	if IntegerToRoman(16) != "XVI" {
		t.Error(`IntegerToRoman(16) != "XVI"`)
	}
}

// Numerals whose minimal form opens with a subtractive pair
func TestRomanToIntegerWithLeadingSubtractivePair(t *testing.T) {
	cases := []struct {
		roman    string
		expected int
	}{
		{"IV", 4},
		{"IX", 9},
		{"XL", 40},
		{"XC", 90},
		{"CD", 400},
		{"CM", 900},
		{"CDXL", 440},
		{"MCMXCIV", 1994},
	}
	for _, c := range cases {
		if got := RomanToInteger(c.roman); got != c.expected {
			t.Errorf("RomanToInteger(%q) = %d, want %d", c.roman, got, c.expected)
		}
	}
}

// Sampled at random from p089_roman.txt
func TestRomanToIntegerAgainstSampledInput(t *testing.T) {
	cases := []struct {
		roman    string
		expected int
	}{
		{"MMMCCCLXXVI", 3376},
		{"MMMMCCLXXXX", 4290},
		{"MMDCCCCXVI", 2916},
		{"MMDCCLXXXII", 2782},
		{"MMDCXXI", 2621},
		{"MMCMLXIIII", 2964},
		{"DLXXXX", 590},
		{"MMDCCXX", 2720},
		{"CCXVI", 216},
		{"MMMDCI", 3601},
	}
	for _, c := range cases {
		if got := RomanToInteger(c.roman); got != c.expected {
			t.Errorf("RomanToInteger(%q) = %d, want %d", c.roman, got, c.expected)
		}
	}
}

// Same 10 entries, mapped to their minimal Roman numeral form
func TestIntegerToRomanAgainstSampledInput(t *testing.T) {
	cases := []struct {
		value    int
		expected string
	}{
		{3376, "MMMCCCLXXVI"},
		{4290, "MMMMCCXC"},
		{2916, "MMCMXVI"},
		{2782, "MMDCCLXXXII"},
		{2621, "MMDCXXI"},
		{2964, "MMCMLXIV"},
		{590, "DXC"},
		{2720, "MMDCCXX"},
		{216, "CCXVI"},
		{3601, "MMMDCI"},
	}
	for _, c := range cases {
		if got := IntegerToRoman(c.value); got != c.expected {
			t.Errorf("IntegerToRoman(%d) = %q, want %q", c.value, got, c.expected)
		}
	}
}

// Same 10 entries, mapped to the characters saved by minimizing each
func TestMinimizedRomanAgainstSampledInput(t *testing.T) {
	cases := []struct {
		roman    string
		expected int
	}{
		{"MMMCCCLXXVI", 0},
		{"MMMMCCLXXXX", 3},
		{"MMDCCCCXVI", 3},
		{"MMDCCLXXXII", 0},
		{"MMDCXXI", 0},
		{"MMCMLXIIII", 2},
		{"DLXXXX", 3},
		{"MMDCCXX", 0},
		{"CCXVI", 0},
		{"MMMDCI", 0},
	}
	for _, c := range cases {
		if got := MinimizedRoman(c.roman); got != c.expected {
			t.Errorf("MinimizedRoman(%q) = %d, want %d", c.roman, got, c.expected)
		}
	}
}

// Same 10 entries sampled at random from p089_roman.txt
func TestCharactersSavedAgainstSampledInput(t *testing.T) {
	romans := []string{
		"MMMCCCLXXVI",
		"MMMMCCLXXXX",
		"MMDCCCCXVI",
		"MMDCCLXXXII",
		"MMDCXXI",
		"MMCMLXIIII",
		"DLXXXX",
		"MMDCCXX",
		"CCXVI",
		"MMMDCI",
	}
	if CharactersSaved(romans) != 11 {
		t.Error(`CharactersSaved(romans) != 11`)
	}
}
