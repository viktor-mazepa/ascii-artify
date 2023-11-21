package main

import (
	"fmt"
	"time"
)

func main() {
	for i := 0; i < 10; i++ {
		fmt.Println("Hello world!")
		time.Sleep(2 * time.Second)
	}
	fmt.Println("Demo application finished execution")
}
