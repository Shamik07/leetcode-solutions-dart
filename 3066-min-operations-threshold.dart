import 'dart:math';

class Solution {
  int minOperations(List<int> nums, int k) {
    // Create a min-heap using PriorityQueue
    var heap = HeapPriorityQueue<int>((a, b) => a.compareTo(b));
    heap.addAll(nums);

    int operations = 0;

    while (heap.isNotEmpty && heap.first < k) {
      if (heap.length < 2) {
        return -1; // Can't satisfy condition
      }

      int x = heap.removeFirst();
      int y = heap.removeFirst();

      // Combine two smallest elements
      int newValue = min(x, y) * 2 + max(x, y);
      heap.add(newValue);
      operations++;
    }

    return heap.isNotEmpty ? operations : -1;
  }
}

class HeapPriorityQueue<E> {
  final Comparator<E> compare;
  final List<E> _heap = [];

  HeapPriorityQueue(this.compare);

  void add(E value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  void addAll(Iterable<E> elements) {
    _heap.addAll(elements);
    for (int i = _heap.length ~/ 2 - 1; i >= 0; i--) {
      _bubbleDown(i);
    }
  }

  E get first => _heap.first;

  E removeFirst() {
    final result = _heap[0];
    _heap[0] = _heap.last;
    _heap.removeLast();
    _bubbleDown(0);
    return result;
  }

  bool get isNotEmpty => _heap.isNotEmpty;
  int get length => _heap.length;

  void _bubbleUp(int index) {
    while (index > 0) {
      final parent = (index - 1) ~/ 2;
      if (compare(_heap[index], _heap[parent]) >= 0) break;
      _swap(index, parent);
      index = parent;
    }
  }

  void _bubbleDown(int index) {
    while (true) {
      final left = 2 * index + 1;
      final right = 2 * index + 2;
      var smallest = index;

      if (left < _heap.length && compare(_heap[left], _heap[smallest]) < 0) {
        smallest = left;
      }
      if (right < _heap.length && compare(_heap[right], _heap[smallest]) < 0) {
        smallest = right;
      }
      if (smallest == index) break;
      _swap(index, smallest);
      index = smallest;
    }
  }

  void _swap(int i, int j) {
    final temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.minOperations([1, 2, 3, 4, 5], 10)); // Expected: 2

  // Test Case 2
  print(solution.minOperations([1, 1, 2, 4, 9], 20)); // Expected: 4

  // Test Case 3
  print(solution.minOperations([5, 5, 5], 15)); // Expected: 1

  // Edge Cases
  print(solution.minOperations([10, 20, 30], 5)); // Already satisfied: 0
  print(solution.minOperations([1, 1], 5)); // Can't satisfy: -1
}
