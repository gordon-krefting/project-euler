package main

import "testing"

func TestFizzBuzzy(t *testing.T) {
	if FizzBuzzy(10) != 23 {
		t.Error(`FizzBuzzy(10) != 23`)
	}
	if FizzBuzzy(1000) != 233168 {
		t.Error(`FizzBuzzy(10) != 233168`)
	}
}
