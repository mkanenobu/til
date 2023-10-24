mod ring_buffer;

fn main() {
    let mut rb = ring_buffer::RingBuffer::<u32>::new(5);

    rb.enqueue(1).unwrap();
    rb.enqueue(2).unwrap();
    rb.enqueue(3).unwrap();

    println!("Dequeue: {:?}", rb.dequeue()); // Should print "Dequeue: Ok(1)"
    println!("Dequeue: {:?}", rb.dequeue()); // Should print "Dequeue: Ok(2)"
    println!("Dequeue: {:?}", rb.dequeue()); // Should print "Dequeue: Ok(3)"
    println!("Dequeue: {:?}", rb.dequeue()); // Should print "Dequeue: Err(Buffer is empty)"
}
