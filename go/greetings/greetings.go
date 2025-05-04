package greetings

import "fmt"

// Hello

// This is hello function !!!
func Hello(name string) string {
	message := fmt.Sprintf("Hi, %v. Welcome!", name)
	return message
}
