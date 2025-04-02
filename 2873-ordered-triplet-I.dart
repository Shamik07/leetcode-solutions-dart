import 'dart:math';

class Solution {
  int maxTripletValue(List<int> nums) {
    int n = nums.length;

    // Precompute right maximums
    List<int> rightMax = List.filled(n, 0);
    rightMax[n - 1] = nums[n - 1];
    for (int i = n - 2; i >= 0; i--) {
      rightMax[i] = max(nums[i], rightMax[i + 1]);
    }

    int maxVal = 0;
    int maxLeft = nums[0];

    for (int j = 1; j < n - 1; j++) {
      int current = (maxLeft - nums[j]) * rightMax[j + 1];
      maxVal = max(maxVal, current);
      maxLeft = max(maxLeft, nums[j]);
    }

    return maxVal;
  }
}

void main() {
  final solution = Solution();

  // Test cases
  print(solution.maxTripletValue([12, 6, 1, 2, 7])); // Expected: 77
  print(solution.maxTripletValue([1, 10, 3, 4, 19])); // Expected: 133
  print(solution.maxTripletValue([1, 2, 3])); // Expected: 0
}
