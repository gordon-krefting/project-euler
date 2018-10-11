package main

import "fmt"
import "io/ioutil"
import "strings"
import "log"

func main() {
	matrix := ReadMatrix("../testmatrix.txt")
	fmt.Println("Raw Matrix")
	for _, row := range matrix {
		fmt.Println(row)
	}
	fmt.Println("----------------------")
	for i := len(matrix) - 1; i >= 0; i-- {
		row := matrix[i]
		for j := len(row) - 1; j >= 0; j-- {
			fmt.Printf("%4s", row[j])
		}
		fmt.Println("")
	}
}

func ReadMatrix(filename string) [][]string {
	rawcontent, err := ioutil.ReadFile(filename)
	if err != nil {
		log.Fatal(err)
	}
	content := strings.TrimRight(string(rawcontent), "\n\r")
	matrix := [][]string{}
	for _, line := range strings.Split(content, "\n") {
		matrix = append(matrix, strings.Split(line, ","))
	}
	return matrix
}
