package main

import "testing"

func TestAllDigitsOdd(t *testing.T) {
	var tests = []struct {
		input int
		want  bool
	}{
		{1, true},
		{2, false},
		{222, false},
		{232, false},
		{111111121, false},
		{135, true},
	}
	for _, test := range tests {
		if got := AllDigitsOdd(test.input); got != test.want {
			t.Errorf("AllDigitsOdd(%v) = %v", test.input, got)
		}
	}
}

func TestReverse(t *testing.T) {
	tests := []struct {
		input int
		want  int
	}{
		{1, 1},
		{12, 21},
		{123, 321},
		{567483, 384765},
	}
	for _, test := range tests {
		if got, _ := Reverse(test.input); got != test.want {
			t.Errorf("Reverse(%v) = %v", test.input, got)
		}
	}

}

func TestReverseError(t *testing.T) {
	tests := []int{10, 0, 100}
	for _, test := range tests {
		if _, err := Reverse(test); err == nil {
			t.Errorf("Reverse(%v) did not fail", test)
		}
	}
}
