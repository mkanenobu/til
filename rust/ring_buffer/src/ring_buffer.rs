use anyhow::{anyhow, Result};

pub struct RingBuffer<T> {
    buffer: Vec<Option<T>>,
    capacity: usize,
    head: usize,
    tail: usize,
}

impl<T: std::fmt::Debug> RingBuffer<T> {
    pub fn new(capacity: usize) -> Self {
        let mut buffer: Vec<Option<T>> = vec![];
        for _ in 0..capacity {
            buffer.push(None);
        }

        Self {
            buffer,
            capacity,
            head: 0,
            tail: 0,
        }
    }

    pub fn enqueue(&mut self, item: T) -> Result<()> {
        let next_tail = (self.tail + 1) % self.capacity;
        if next_tail == self.head {
            return Err(anyhow!("Buffer is full"));
        }

        self.buffer[self.tail] = Some(item);
        self.tail = next_tail;
        Ok(())
    }

    pub fn dequeue(&mut self) -> Result<T> {
        if self.head == self.tail {
            return Err(anyhow!("Buffer is empty"));
        }

        let item = self.buffer[self.head].take().expect("Item must exist");
        self.head = (self.head + 1) % self.capacity;
        Ok(item)
    }
}
