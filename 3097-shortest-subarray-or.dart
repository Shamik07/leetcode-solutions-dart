import 'dart:math';

class Solution {
  int minimumSubarrayLength(List<int> nums, int k) {
    if (k == 0) return 1; // Any single element satisfies OR >= 0

    int n = nums.length;
    int minLen = n + 1;
    int currentOr = 0;
    int left = 0;

    for (int right = 0; right < n; right++) {
      currentOr |= nums[right];

      while (currentOr >= k && left <= right) {
        minLen = min(minLen, right - left + 1);
        // Try to reduce window size while maintaining OR >= k
        int tempOr = 0;
        for (int i = right; i >= left; i--) {
          tempOr |= nums[i];
          if (tempOr >= k) {
            minLen = min(minLen, right - i + 1);
          }
        }
        left++;
        currentOr = 0;
        for (int i = left; i <= right; i++) {
          currentOr |= nums[i];
        }
      }
    }

    return minLen <= n ? minLen : -1;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.minimumSubarrayLength([1, 2, 3], 2)); // Expected: 1

  // Test Case 2
  print(solution.minimumSubarrayLength([2, 1, 8], 10)); // Expected: 3

  // Test Case 3
  print(solution.minimumSubarrayLength([1, 2], 0)); // Expected: 1

  // Edge Cases
  print(solution.minimumSubarrayLength([1, 1, 1], 4)); // Expected: -1
  print(solution.minimumSubarrayLength([8], 7)); // Expected: 1
}
