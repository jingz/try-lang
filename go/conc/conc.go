package main

import (
	"fmt"
	"runtime"
	"sync"
	"sync/atomic"
	"time"
)

type Request struct {
	args       []int
	f          func([]int) int
	resultChan chan int
}

func sum(a []int) (s int) {
	for _, v := range a {
		s += v
	}
	return
}

func handle(queue chan *Request) {
	for req := range queue {
		req.resultChan <- req.f(req.args)
	}
}

func main() {
	// The number of maximum processes (CPUs)
	fmt.Print("You are using ", runtime.Compiler, " ")
	fmt.Println("on a", runtime.GOARCH, "machine")
	fmt.Println("Using Go version", runtime.Version())
	fmt.Println("GOMAXPROCS:", runtime.GOMAXPROCS(0))

	// CHANNEL & Goroutine -------------------------------------------------------

	// making an unbuffered channel
	ch := make(chan int)
	fmt.Println("what is value in `ch` ->", ch)

	// Running a goroutine with non-blocking manner
	go func() {
		ch <- 100
	}()

	fmt.Println(ch, <-ch)

	// NOTE try close channel before read
	close(ch)

	// -------------------------------------------------------------------------------------
	// More on realworld usecase for handling http request in a framework

	req1 := &Request{[]int{1, 1, 1}, sum, make(chan int)}
	req2 := &Request{[]int{2, 2, 2}, sum, make(chan int)}
	// req3 := &Request{[]int{3, 3, 3}, sum, make(chan int)}

	cr := make(chan *Request, 2) // unbuffered channel, able to accept 3 request at a time

	// Simulate 2 incoming requests
	go func() {
		cr <- req1
		time.Sleep(time.Millisecond * 100) // wait for a sec
		cr <- req2
	}()

	// request handler
	go handle(cr)

	now := time.Now()
	fmt.Println("req1 result ->", <-req1.resultChan)
	fmt.Println("req2 result ->", <-req2.resultChan, time.Since(now))

	// ------------------------------------------------------------------
	// Select

	c1 := make(chan int)
	c2 := make(chan int)
	c3 := make(chan int)

	var swg sync.WaitGroup
	// add a goroutine
	swg.Add(3)
	go func() {
		defer swg.Done()
		c1 <- 8
	}()

	go func() {
		defer swg.Done()
		c2 <- 2
	}()

	go func() {
		defer swg.Done()
		c3 <- 3
	}()

	var r int
	select {
	case r = <-c1:
		break
	case r = <-c2:
		break
	case r = <-c3:
		break
	}

	fmt.Println(r)

	// explicitly close channels
	// close(c1)
	// close(c2)
	// close(c3)

	// try to read data from a closed channel
	// fmtx.Println(<-c1)

	// Mutex ------------------------------------------------------------

	// NOTE This is unsafe count
	si := 0
	unsafeCountFunc := func() {
		si++
	}

	for i := 0; i < 1000; i++ {
		go unsafeCountFunc()
	}

	// make sure all goroutines done
	time.Sleep(time.Millisecond * 200)

	fmt.Println("Unsafe Count ->", si)

	// Safe count --------------------------------------------------

	si = 0            // sum int
	var mu sync.Mutex // using mutex here
	safeCountFunc := func() {
		mu.Lock()
		defer mu.Unlock()
		si++
	}

	for i := 0; i < 1000; i++ {
		go safeCountFunc()
	}

	// make sure all goroutines done
	time.Sleep(time.Millisecond * 200)

	fmt.Println("Safe Count ->", si)

	// ------------------------------------------------------------
	// Atomic
	// use as alternative to Mutex, but Mutex still more versatile

	X := 100
	Y := 4

	// the final result should be 400
	type atomCounter struct {
		val int64
	}

	// scoped concurrency by using WaitGroup from sync package
	var wg sync.WaitGroup

	// a shared variable
	cnt := atomCounter{}

	for i := 0; i < X; i++ {
		// add a goutine to wait for
		wg.Add(1)

		go func(no int) {
			// decrease the goroutine counter
			defer wg.Done()
			for i := 0; i < Y; i++ {
				// writing to share variable
				atomic.AddInt64(&cnt.val, 1)
			}
		}(i)
	}
	// where is goroutines joint
	wg.Wait()

	fmt.Println(atomic.LoadInt64(&cnt.val))
	// --------------------------------------------------------------
}
