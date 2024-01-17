package main

import (
	"fmt"
	"time"
)

func ExponentialBackoffDurations(interval time.Duration, backoffRate int, maxAttempts int) []time.Duration {
	if backoffRate <= 0 {
		backoffRate = 2
	}
	if maxAttempts <= 0 {
		maxAttempts = 10
	}
	if interval <= 0 {
		interval = time.Second
	}

	durations := make([]time.Duration, maxAttempts)
	for i := 0; i < maxAttempts; i++ {
		durations[i] = interval
		interval *= time.Duration(backoffRate)
	}
	return durations
}

func formatDuration(d time.Duration) string {
	return fmt.Sprintf("%02d:%02d:%02d", int(d.Hours()), int(d.Minutes())%60, int(d.Seconds())%60)
}

func main() {
	durations := ExponentialBackoffDurations(time.Second*3, 2, 10)
	for i, duration := range durations {
		fmt.Printf("%d: %s\n", i+1, formatDuration(duration))
	}
}
