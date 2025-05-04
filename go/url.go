package main

import (
	"fmt"
	"net/url"
)

func main() {
	baseUrl, err := url.Parse("https://example.com")
	if err != nil {
	}

	_path := "/test/123"
	// fmt.Println(baseUrl.JoinPath(_path).String())
	fmt.Println(baseUrl.JoinPath(_path).String())
}
