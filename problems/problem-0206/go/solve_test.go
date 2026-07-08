package main

import "testing"

func TestFindConcealedSquare(t *testing.T) {
	want := 1389019170
	if got := findConcealedSquare(); got != want {
		t.Errorf("findConcealedSquare() = %v, want %v", got, want)
	}
}
