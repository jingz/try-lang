/*
The package is intended for giving a tour of overview features in go

	focusing on data types usage
	the code snippet in this package almost the same to
	the Mastering Go book
*/
package main

import (
	"errors"
	"fmt"
	"go/greetings"
	"math/rand"
	"os"
	"reflect" // used in reflect
	"regexp"
	"sort" // used in sorting slice section
	"strconv"
	"strings"
	"time"
	"unicode"
)

// for error data types ( must import "errors" )
func check(a, b int) error {
	if a == 0 && b == 0 {
		return errors.New("this is a custom error message")
	}

	return nil
}

// formattedError
//
// This function will return formatted error
func formattedError(a, b int) error {
	if a == 0 && b == 0 {
		return fmt.Errorf("a %d and b %d. UserId: %d", a, b, os.Getuid())
	}

	return nil
}

// used in slice
func change(s []string) {
	s[0] = "change_function"
}

// used in pointer section
func processPointerFn(x *float64) {
	*x = *x * *x
}

func returnPointerFn(x float64) *float64 {
	temp := 2 * x
	return &temp
}

func bothPointers(x *float64) *float64 {
	temp := 2 * *x
	return &temp
}

// used in randomness
func random(min, max int) int {
	return rand.Intn(max-min) + min
}

// ===================================
// main
// ===================================
func main() {
	fmt.Println("hello world!")

	// import from another package
	message := greetings.Hello("Jing")
	fmt.Println(message)

	// ========================================> DATA TYPES
	// Error Types
	// ----------------------------------------------------
	err := check(0, 0)
	if err != nil {
		fmt.Println(err)
	}

	err = formattedError(0, 0)
	if err != nil {
		fmt.Println(err)
	}

	i, err := strconv.Atoi("-123")
	if err == nil {
		fmt.Println("Int value is", i)
	}

	i, err = strconv.Atoi("Y123")
	if err != nil {
		fmt.Println(err)
	}

	// ----------------------------------------------------
	// Numeric Types
	// ----------------------------------------------------
	// complex
	c1 := 12 + 1i
	c2 := complex(5, 7)
	// hacking printing inline by comment revsered printing
	fmt.Printf("Type of c1: %T\n", c1) // fmt.Println
	fmt.Printf("Type of c2: %T\n", c2) // fmt.Println

	var c3 complex64 = complex64(c1 + c2)
	fmt.Println("c3:", c3)
	cZero := c3 - c3
	fmt.Printf("Type of c3: %T\n", c3) // fmt.Println
	fmt.Println("cZero:", cZero)

	// int
	x := 12
	k := 5
	fmt.Println(x)
	fmt.Printf("Type of x: %T\n", x) // fmt.Println
	div := x / k
	fmt.Println(div)

	// float
	var m, n float64
	m = 1.223
	fmt.Println("m, n:", m, n)
	// noticing that n is automatically assigned to 0

	y := 4 / 2.3
	fmt.Println(y)

	// convert the above int
	divFloat := float64(x) / float64(k)
	fmt.Println(divFloat)
	fmt.Printf("Type of devFloat %T\n", divFloat) // fmt.Println

	// ----------------------------------------------------
	// Non-Numeric Types
	// import "strings", "unicode"
	// ----------------------------------------------------
	// string
	aString := "Hello world! €"
	fmt.Println(aString)
	fmt.Println(string(aString[0]))

	// rune is int32 storing unicode point
	r := '€'
	fmt.Println("As an int32 value of €:", r)

	for _, v := range aString {
		fmt.Printf("%x ", v)
	}
	fmt.Println()

	// converting int to string
	input := strconv.Itoa(100)
	fmt.Println(input)
	input = strconv.FormatInt(int64(100), 10)
	fmt.Println(input)
	// noticing that the 2 above assignments are equivalent

	fmt.Println(strings.EqualFold("Jing", "JING"))
	fmt.Printf("%v\n", strings.EqualFold("Jing", "JING")) // fmt.Println
	fmt.Printf("%v\n", strings.EqualFold("Jing", "JIN"))  // fmt.Println

	fmt.Printf("%v\n", strings.Index("Jing", "in")) // fmt.Println
	fmt.Printf("%v\n", strings.Index("Jing", "In")) // fmt.Println

	fmt.Printf("%v\n", strings.HasPrefix("Jing", "Ji")) // fmt.Println
	fmt.Printf("%v\n", strings.HasPrefix("Jing", "ji")) // fmt.Println

	fmt.Printf("%v\n", strings.HasSuffix("Jing", "ng")) // fmt.Println
	fmt.Printf("%v\n", strings.HasSuffix("Jing", "Ng")) // fmt.Println

	f := strings.Fields("This is a string!")
	fmt.Println(f, len(f), f[0], f[3])

	f = strings.Fields("ThisIs a\tstring!")
	fmt.Println(f, len(f))

	fmt.Println(strings.Split("abcd efg", ""))

	fmt.Println(strings.Replace("abcd efg", "", "_", -1))
	fmt.Println(strings.Replace("abcd efg", "", "_", 4))
	fmt.Println(strings.Replace("abcd efg", "", "_", 2))

	fmt.Println(strings.SplitAfter("123+++452++", "++"))
	fmt.Println("Bearer " + "Token")

	trimFunction := func(c rune) bool {
		return !unicode.IsLetter(c)
	}

	fmt.Println(strings.TrimFunc("123 abc ABC \t .", trimFunction))
	// NOTE like a filter but Its called trim

	// ----------------------------------------------------
	// Date and Time
	// import "time"
	// ----------------------------------------------------
	start := time.Now()
	fmt.Println(start)

	// NOTE refer to the date string parsing table
	d, errTime := time.Parse("02 January 2006", "09 March 2023")
	if errTime == nil {
		fmt.Println(d)
		fmt.Println(d.Day(), d.Month(), d.Year())
		fmt.Println(d.Hour(), d.Minute())
	}

	d, errTime = time.Parse("02 January 2006 15:04", "09 January 2023 12:30")
	if errTime == nil {
		fmt.Println(d)
		fmt.Println(d.Day(), d.Month(), d.Year())
		fmt.Println(d.Hour(), d.Minute())
	}

	d, errTime = time.Parse("02-01-2006 15:04", "09-01-2023 12:20")
	if errTime == nil {
		fmt.Println(d)
		fmt.Println(d.Day(), d.Month(), d.Year())
		fmt.Println(d.Hour(), d.Minute())
	}

	// Time only
	d, errTime = time.Parse("15:04", "12:20")
	if errTime == nil {
		fmt.Println(d)
		fmt.Println(d.Day(), d.Month(), d.Year())
		fmt.Println(d.Hour(), d.Minute())
	}

	// Unix time
	ut := time.Now().Unix()
	fmt.Println("Epoch time:", ut)

	d = time.Unix(ut, 0)
	fmt.Println(d.Day(), d.Month(), d.Year())
	fmt.Println(d.Hour(), d.Minute())

	duration := time.Since(start)
	fmt.Println(duration)

	// Timzone
	loc, _ := time.LoadLocation("Asia/Bangkok")
	// NOTE now.In(loc) -> not work
	fmt.Println(loc)

	// ----------------------------------------------------
	// Constant
	// ----------------------------------------------------

	// declare new types
	type Digit int
	type Power2 int

	const PI = 3.1415926
	const (
		C1 = "C1C1C1"
		C2 = "C2C2C2"
		C3 = "C3C3C3"
	)

	fmt.Println(PI, C1, C2, C3)

	const s1 = 123
	var v1 float32 = s1 * 12
	fmt.Println(s1, v1)

	const (
		Zero Digit = iota
		One
		Two
		Three
		Four
	)

	fmt.Println(Zero, One, Two, Three, Four)

	const (
		p2_0 Power2 = 1 << iota
		_
		p2_2
		_
		p2_4
		_
		p2_6
	)

	fmt.Println(p2_0, p2_2, p2_4, p2_6)

	// ----------------------------------------------------
	// Grouping similar data
	// ----------------------------------------------------

	// array
	// 1. must define its size
	// 2. the size cannot change
	// 3. pass copy to a function

	aa := [4]string{"Zero", "One", "Two", "Three"}
	fmt.Println(aa)
	// NOTE if aa length is 3 the following error is fired
	// !! ./wirlwindtour.go:258:43: index 3 is out of bounds (>= 3)

	// slice
	// 1. Its dynamic, can grow and shrink
	// 2. pass a reference pointer to function
	// 3. structure { Data uintptr, Len int, Cap int }

	aSlice1 := []float64{}
	fmt.Println(aSlice1, len(aSlice1), cap(aSlice1))

	aSlice1 = append(aSlice1, 123.12)
	aSlice1 = append(aSlice1, -43.12)
	fmt.Println(aSlice1, len(aSlice1), cap(aSlice1))

	tt := make([]int, 4)
	tt[0] = -1
	tt[1] = -2
	tt[2] = -3
	tt[3] = -4

	// NOTE now we will need to use append
	tt = append(tt, -5)
	fmt.Println(tt)

	twoD := [][]int{{1, 2, 3}, {4, 5, 6}}
	for _, i := range twoD {
		for _, k := range i {
			fmt.Print(k, " ")
		}
		fmt.Print(", ")
	}
	fmt.Println()

	mk2D := make([][]int, 2)
	fmt.Println(mk2D)

	mk2D[0] = []int{1, 2, 3, 4}
	mk2D[1] = []int{-1, -2, -3, -4}
	fmt.Println(mk2D)

	// Cap
	// ---
	a := make([]int, 4)
	fmt.Println("Len", len(a), "Cap", cap(a))

	b := []int{0, 1, 3, 4}
	fmt.Println("Len", len(b), "Cap", cap(b))

	aSliceA := make([]int, 4, 4)
	fmt.Println(aSliceA)
	aSliceA = append(aSliceA, 5)
	fmt.Println(aSliceA)
	// NOTE the cap should be doubled
	fmt.Println("Len", len(aSliceA), "Cap", cap(aSliceA))

	aSliceA = append(aSliceA, []int{-1, -2, -3, -4}...) // adding 4 elements
	// NOTE the cap should be again doubled
	fmt.Println("Len", len(aSliceA), "Cap", cap(aSliceA))

	// Selecing part of slice
	aSlice := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	fmt.Println(aSlice)
	l := len(aSlice)

	fmt.Println(aSlice[0:5])
	fmt.Println(aSlice[:5])

	// NOTE last two
	fmt.Println(aSlice[l-2 : l])

	fmt.Println(aSlice[l-2:])

	t := aSlice[0:5:10]
	fmt.Println("Len", len(t), "Cap:", cap(t))

	t = aSlice[2:5:10]
	fmt.Println("Len", len(t), "Cap", cap(t), t)

	t = aSlice[:5:6]
	fmt.Println(len(t), cap(t))

	// Byte slice
	bb := make([]byte, 12)
	fmt.Println(bb)

	// NOTE converting a string into byte slice
	bb = []byte("Byte slice €")
	fmt.Println(bb, len(bb))
	fmt.Println(string(bb))

	// Deleting an element from a slice
	// -------------------------------
	aSliceB := []int{1, 2, 3, 4, 5, 6, 7, 8}
	fmt.Println("Original slice", aSliceB)

	var removedIndex int = 3
	aSliceB = append(aSliceB[:removedIndex], aSliceB[removedIndex+1:]...)
	// NOTE 4 should be removed
	fmt.Println(aSliceB)

	// alternative way: copy and trim
	aSliceB = []int{1, 2, 3, 4, 5, 6, 7, 8}
	aSliceB[removedIndex] = aSliceB[len(aSliceB)-1]
	fmt.Println(aSliceB)
	aSliceB = aSliceB[:len(aSliceB)-1]
	fmt.Println(aSliceB)

	// How slices are connected to arrays
	// ----------------------------------
	a2 := [4]string{"Zero", "one", "Two", "Three"}
	fmt.Println(a2)

	var s0 = a2[0:1]
	fmt.Println(s0)
	s0[0] = "S0"
	// NOTE the array value is also updated due to slice reference
	fmt.Println(a2)

	var s12 = a2[1:3]
	fmt.Println(s12)
	s12[0] = "S12_0"
	s12[1] = "S12_1"
	fmt.Println(s12, a2)

	change(s12)
	fmt.Println(a2)
	fmt.Println(cap(s0), len(s0))

	s0 = append(s0, "N1")
	s0 = append(s0, "N2")
	s0 = append(s0, "N3")
	a2[0] = "-N1"
	s0 = append(s0, "N4")

	// NOTE cap s0 updated so s0 does not point to a2[0] anymore
	fmt.Println(cap(s0), len(s0), s0)
	// that mean N4 is not in a2
	fmt.Println(a2)

	a2[0] = "-N1-"
	a2[1] = "-N2-"

	fmt.Println("S0:", s0)
	fmt.Println("a2:", a2)
	fmt.Println("s12:", s12)

	// copy an existing array to a slice

	cs1 := []int{1}
	cs2 := []int{-1, -2}
	cs5 := []int{10, 11, 12, 13, 14}
	fmt.Println(cs1)
	fmt.Println(cs2)
	fmt.Println(cs5)

	// copy(destination, source)
	// copy cs2 to cs1
	copy(cs1, cs2)
	fmt.Println(cs1)
	fmt.Println(cs2)

	copy(cs1, cs5)
	fmt.Println(cs1)
	fmt.Println(cs5)

	copy(cs5, cs2)
	fmt.Println(cs2)
	// NOTE that cs5's size remain the same
	fmt.Println(cs5)

	// sorting -> import "sort"
	sInts := []int{1, 0, 2, -3, 4, -20}
	sFloats := []float64{1.0, 0.2, 0.22, -3, 4.1, -0.1}
	sStrings := []string{"aa", "a", "A", "Aa", "aab", "AAa"}

	fmt.Println("sInts original:", sInts)
	sort.Ints(sInts)
	fmt.Println("sInts:", sInts)

	sort.Sort(sort.Reverse(sort.IntSlice(sInts)))
	fmt.Println("Reverse:", sInts)
	fmt.Println("sFloats original:", sFloats)

	sort.Float64s(sFloats)
	fmt.Println("sFloats:", sFloats)

	sort.Sort(sort.Reverse(sort.Float64Slice(sFloats)))
	fmt.Println("Reverse:", sFloats)
	fmt.Println("sStrings original:", sStrings)

	sort.Strings(sStrings)
	fmt.Println("sStrings:", sStrings)

	sort.Sort(sort.Reverse(sort.StringSlice(sStrings)))
	fmt.Println("Reverse:", sStrings)

	// -------------------------------------------------------------------------
	// Pointer
	// 1. Share data btw functions
	// 2. Different btw zero value and nil
	// 3. Support data structures like linked lists and binary trees
	// -------------------------------------------------------------------------

	type aStructure struct {
		field1 complex128
		field2 int
	}

	var ff float64 = 12.123
	fmt.Println(&ff)

	fp := &ff
	fmt.Println(fp)
	fmt.Println(*fp)

	x504 := returnPointerFn(ff)
	fmt.Println(x504)

	x507 := bothPointers(fp)
	fmt.Println(*x507)

	var k510 *aStructure
	// check for empty structure
	fmt.Println(k510)

	if k510 == nil {
		k510 = new(aStructure)
	}

	fmt.Println(k510)
	if k510 != nil {
		fmt.Println("k510 is not nil!")
	}

	// -----------------------------------
	// Generating random
	// -----------------------------------

	fmt.Println(random(10, 500))

	/*
	   // =====================================================> Composite Data Types
	   // Map
	   // # versatile
	   // # fast on reading and writing
	   // # easy to understand
	   // ---------------------------------------------
	*/

	m542 := map[string]int{
		"key1": -1,
		"key2": 123,
	}

	fmt.Println(m542)
	fmt.Println(m542["test"])

	for _, v := range m542 {
		fmt.Print(" # ", v)
	}

	fmt.Println()

	// -------------------------------------------------------
	// Structure
	// -------------------------------------------------------
	type Entry struct {
		Name    string
		Surname string
		Year    int
	}

	a564 := Entry{}
	fmt.Println(a564)

	a567 := Entry{Name: "Jing", Surname: "Gnij", Year: 2000}
	fmt.Println(a567)
	fmt.Println(a567.Name)

	a570 := new(Entry)
	// NOTE new return a pointer
	fmt.Println(a570)

	// Slice of structures
	type record struct {
		f1 int
		f2 string
	}

	s576 := []record{}
	for i := 0; i < 10; i++ {
		text := "text" + strconv.Itoa(i)
		temp := record{f1: i, f2: text}
		s576 = append(s576, temp)
	}

	fmt.Println(s576[0].f1, s576[0].f2, len(s576))

	// -------------------------------------------------------
	// Regexp
	// -------------------------------------------------------

	t594 := []byte("Jing")
	fmt.Println(t594)
	re := regexp.MustCompile(`^J`)
	fmt.Println(re.Match(t594))

	// -------------------------------------------------------
	// Reflection
	// -------------------------------------------------------

	type Secret struct {
		Username string
		Password string
	}

	type Datarow struct {
		f1 string
		f2 float64
		f3 Secret
	}

	x615 := Datarow{"String value", -12.55, Secret{"Jing", "123456"}}
	fmt.Println(x615)

	r6 := reflect.ValueOf(x615)
	fmt.Println(r6.String())

	iType := r6.Type()
	fmt.Println(iType, r6.NumField())
	fmt.Println(iType.Field(0).Name)
	fmt.Println(r6.Field(0).Type())
	// ERROR xfmt.Println(r6.Field(0).Interface())
	// k62 := reflect.TypeOf(r6.Field(0).Interface()).kind()
}
