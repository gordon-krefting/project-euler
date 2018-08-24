package main

import "testing"

func TestReverse(t *testing.T) {
	var tests = []struct {
		input int
		want  int
	}{
		{1, 11},
		{12, 21},
		{123, 321},
		{567483, 384765},
	}
	Reverse(10)
	for _, test := range tests {
		if got, _ := Reverse(test.input); got != test.want {
			t.Errorf("Reverse(%v) = %v", test.input, got)
		}
	}

}
