package main

import "testing"

func TestEvenFibonacciSum(t *testing.T) {
	if EvenFibonacciSum(10) != 10 {
		t.Error(`EvenFibonacciSum(10) != 10`)
	}
	if EvenFibonacciSum(4000000) != 4613732 {
		t.Error(`EvenFibonacciSum(4000000) != 4613732`)
	}
}
