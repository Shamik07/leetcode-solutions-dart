class MinHeap {
  List<int> heap = [];

  void add(int val) {
    heap.add(val);
    _siftUp(heap.length - 1);
  }

  int peek() {
    if (heap.isEmpty) throw Exception('Empty heap');
    return heap[0];
  }

  int remove() {
    if (heap.isEmpty) throw Exception('Empty heap');
    int result = heap[0];
    int last = heap.removeLast();
    if (heap.isNotEmpty) {
      heap[0] = last;
      _siftDown(0);
    }
    return result;
  }

  void _siftUp(int index) {
    while (index > 0) {
      int parent = (index - 1) ~/ 2;
      if (heap[parent] <= heap[index]) break;
      _swap(parent, index);
      index = parent;
    }
  }

  void _siftDown(int index) {
    int length = heap.length;
    while (true) {
      int smallest = index;
      int left = 2 * index + 1;
      int right = 2 * index + 2;

      if (left < length && heap[left] < heap[smallest]) {
        smallest = left;
      }
      if (right < length && heap[right] < heap[smallest]) {
        smallest = right;
      }
      if (smallest == index) break;
      _swap(index, smallest);
      index = smallest;
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  int get length => heap.length;
}

class KthLargest {
  late MinHeap _heap;
  late int _k;

  KthLargest(int k, List<int> nums) {
    _heap = MinHeap();
    _k = k;

    for (int num in nums) {
      add(num);
    }
  }

  int add(int val) {
    if (_heap.length < _k) {
      _heap.add(val);
    } else if (val > _heap.peek()) {
      _heap.remove();
      _heap.add(val);
    }

    return _heap.peek();
  }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * KthLargest obj = KthLargest(k, nums);
 * int param1 = obj.add(val);
 */

void main() {
  // Example 1
  var kthLargest1 = KthLargest(3, [4, 5, 8, 2]);
  print(kthLargest1.add(3)); // return 4
  print(kthLargest1.add(5)); // return 5
  print(kthLargest1.add(10)); // return 5
  print(kthLargest1.add(9)); // return 8
  print(kthLargest1.add(4)); // return 8

  // Example 2
  var kthLargest2 = KthLargest(4, [7, 7, 7, 7, 8, 3]);
  print(kthLargest2.add(2)); // return 7
  print(kthLargest2.add(10)); // return 7
  print(kthLargest2.add(9)); // return 7
  print(kthLargest2.add(9)); // return 8
}
