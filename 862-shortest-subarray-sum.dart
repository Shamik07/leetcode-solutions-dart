import 'dart:collection';

class Solution {
  int shortestSubarray(List<int> nums, int k) {
    int n = nums.length;
    List<int> prefixSum = List.filled(n + 1, 0);

    // prefix sum
    for (int i = 0; i < n; i++) {
      prefixSum[i + 1] = prefixSum[i] + nums[i];
    }

    int result = n + 1;
    Queue<int> deque = Queue<int>();

    for (int i = 0; i <= n; i++) {
      // Check if valid subarray
      while (deque.isNotEmpty && prefixSum[i] - prefixSum[deque.first] >= k) {
        result = result < (i - deque.first) ? result : (i - deque.first);
        deque.removeFirst();
      }

      while (deque.isNotEmpty && prefixSum[i] <= prefixSum[deque.last]) {
        deque.removeLast();
      }

      deque.addLast(i);
    }

    return result == n + 1 ? -1 : result;
  }
}

void main() {
  Solution solution = new Solution();

  print(solution.shortestSubarray([1], 1)); // Output: 1
  print(solution.shortestSubarray([1, 2], 4)); // Output: -1
  print(solution.shortestSubarray([2, -1, 2], 3)); // Output: 3
}
