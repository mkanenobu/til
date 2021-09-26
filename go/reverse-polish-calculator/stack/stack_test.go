package stack

import (
	"testing"
)

func TestCreateStack(t *testing.T) {
	t.Run("CreateStack", func(t *testing.T) {
		s1 := CreateStack(0)
		if len(s1.Data) != 0 || s1.Size != 0 {
			t.Errorf("Initial length = %v, size = %v, want 0", len(s1.Data), s1.Size)
		}
		if cap(s1.Data) != 0 {
			t.Errorf("Cap = %v, want 0", cap(s1.Data))
		}

		s2 := CreateStack(10)
		if len(s2.Data) != 0 || s2.Size != 0 {
			t.Errorf("Initial length = %v, size = %v, want 0", len(s2.Data), s2.Size)
		}
		if cap(s2.Data) != 10 {
			t.Errorf("Cap = %v, want 10", cap(s2.Data))
		}
	})
}

func TestStack_Put(t *testing.T) {
	t.Run("Stack_Put", func(t *testing.T) {
		s := CreateStack(10)
		s.Put(3)
		if len(s.Data) != 1 || s.Size != 1 {
			t.Errorf("size: %v, want 1", s.Size)
		}
		if  s.Data[0] != 3 {
			t.Errorf("data: %+v, want [3]", s.Data)
		}
	})
}