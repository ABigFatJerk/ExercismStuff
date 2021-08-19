using System;

public class CircularBuffer<T>
{
    private int capacity, occupied;
    private T[] buffer;

    private int head, tail;

    public CircularBuffer(int capacity)
    {
        this.capacity = capacity;
        this.occupied = 0;
        this.buffer = new T[this.capacity];
        this.head = this.tail = 0;
    }

    public T Read()
    {
        if (IsEmpty()) {
            throw new InvalidOperationException("Can't read from an empty buffer.");
        }

        T value = buffer[head];
        head = MovePointer(head);
        occupied--;
        return value;
    }

    public void Write(T value)
    {
        if (isFull()) {
            throw new InvalidOperationException("Can't add to a full buffer");
        }

        buffer[tail] = value;
        tail = MovePointer(tail);
        occupied++;
    }

    public void Overwrite(T value)
    {
        if (!isFull()) {
            Write(value);
        } else {
            buffer[head] = value;
            head = MovePointer(head);
            tail = MovePointer(tail);
        }
    }

    public void Clear()
    {
        this.occupied = 0;
        this.tail = this.head;
    }

    private bool IsEmpty() {
        return occupied == 0;
    }

    private bool isFull() {
        return occupied == capacity;
    }

    private int MovePointer(int pointer) {
        return (pointer + 1) % capacity;
    }
}