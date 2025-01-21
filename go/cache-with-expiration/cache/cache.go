package cache

import (
	"sync"
	"time"
)

type CacheItem[T any] struct {
	Value      T
	Expiration int64
}

type Cache[T any] struct {
	items map[string]CacheItem[T]
	mu    sync.RWMutex
}

func New[T any](cleanupInterval time.Duration) *Cache[T] {
	c := &Cache[T]{
		items: make(map[string]CacheItem[T]),
	}

	go c.startCleanupTimer(cleanupInterval)

	return c
}

func (c *Cache[T]) Set(key string, value T, ttl time.Duration) {
	expiration := time.Now().Add(ttl).UnixNano()

	c.mu.Lock()
	defer c.mu.Unlock()

	c.items[key] = CacheItem[T]{
		Value:      value,
		Expiration: expiration,
	}
}

func (c *Cache[T]) Get(key string) (*T, bool) {
	c.mu.RLock()
	defer c.mu.RUnlock()

	item, ok := c.items[key]
	if !ok {
		return nil, false
	}

	if time.Now().UnixNano() > item.Expiration {
		return nil, false
	}

	return &item.Value, true
}

func (c *Cache[T]) Delete(key string) {
	c.mu.Lock()
	defer c.mu.Unlock()

	delete(c.items, key)
}

func (c *Cache[T]) startCleanupTimer(interval time.Duration) {
	ticker := time.NewTicker(interval)
	go func() {
		for range ticker.C {
			c.cleanup()
		}
	}()
}

func (c *Cache[T]) cleanup() {
	c.mu.Lock()
	defer c.mu.Unlock()

	for key, item := range c.items {
		if time.Now().UnixNano() > item.Expiration {
			delete(c.items, key)
		}
	}
}
