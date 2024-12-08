import 'dart:math';

class Solution {
  int maxTwoEvents(List<List<int>> events) {
    events.sort((a, b) => a[1].compareTo(b[1]));

    int n = events.length;
    List<int> maxValues = List.filled(n, 0);
    maxValues[0] = events[0][2];

    for (int i = 1; i < n; i++) {
      maxValues[i] = max(maxValues[i - 1], events[i][2]);
    }

    int result = 0;

    int binarySearch(int start) {
      int left = 0, right = n - 1, bestIndex = -1;
      while (left <= right) {
        int mid = (left + right) ~/ 2;
        if (events[mid][1] < start) {
          bestIndex = mid;
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }
      return bestIndex;
    }

    for (int i = 0; i < n; i++) {
      int currentSum = events[i][2];
      int idx = binarySearch(events[i][0]);

      if (idx != -1) {
        currentSum += maxValues[idx];
      }

      result = max(result, currentSum);
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();

  // Example 1
  List<List<int>> events1 = [
    [1, 3, 2],
    [4, 5, 2],
    [2, 4, 3]
  ];
  print("Output: ${solution.maxTwoEvents(events1)}"); // Expected output: 4

  // Example 2
  List<List<int>> events2 = [
    [1, 3, 2],
    [4, 5, 2],
    [1, 5, 5]
  ];
  print("Output: ${solution.maxTwoEvents(events2)}"); // Expected output: 5

  // Example 3
  List<List<int>> events3 = [
    [1, 5, 3],
    [1, 5, 1],
    [6, 6, 5]
  ];
  print("Output: ${solution.maxTwoEvents(events3)}"); // Expected output: 8
}
