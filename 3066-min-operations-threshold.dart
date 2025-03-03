import 'package:collection/collection.dart';

class Solution {
  int minOperations(List<int> nums, int k) {
    var heap = HeapPriorityQueue<int>((a, b) => a.compareTo(b));

    for (int num in nums) {
      heap.add(num);
    }

    int operations = 0;

    while (heap.isNotEmpty && heap.first < k) {
      if (heap.length < 2) {
        break;
      }

      int x = heap.removeFirst();
      int y = heap.removeFirst();

      int newValue = (x < y ? x : y) * 2 + (x > y ? x : y);

      heap.add(newValue);

      operations++;
    }

    return operations;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.minOperations([1, 2, 3, 4, 5], 10)); // 2

  // Test Case 2
  print(solution.minOperations([1, 1, 2, 4, 9], 20)); // 4

  // Test Case 3
  print(solution.minOperations([5, 5, 5], 15)); // 1
}
