package main

import "fmt"
import "io/ioutil"
import "strings"
import "log"

func main() {
	matrix := ReadMatrix("../testmatrix.txt")
	fmt.Println(matrix)
	fmt.Println("-----")
	for i, row := range matrix {
		fmt.Printf("%v -> %s\n", i, row)
	}
}

func ReadMatrix(filename string) [][]string {
	rawcontent, err := ioutil.ReadFile(filename)
	content := strings.TrimRight(string(rawcontent), "\n\r")
	if err != nil {
		log.Fatal(err)
	}
	matrix := [][]string{}
	for _, line := range strings.Split(content, "\n") {
		matrix = append(matrix, strings.Split(line, ","))
	}
	return matrix
}
