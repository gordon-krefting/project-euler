package main

import "testing"

func TestReadGrid(t *testing.T) {
	matrix := ReadMatrix("../testmatrix.txt")
	if len(matrix) != 5 {
		t.Error(`len(matrix) != 5. was `, len(matrix))
	}
	matrix = ReadMatrix("../matrix.txt")
	if len(matrix) != 80 {
		t.Error(`len(matrix) != 80. was `, len(matrix))
	}
}
