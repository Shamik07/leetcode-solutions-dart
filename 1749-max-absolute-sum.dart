class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int maxSum = nums[0];
    int minSum = nums[0];
    int currentMax = nums[0];
    int currentMin = nums[0];
    int result = nums[0].abs();

    for (int i = 1; i < nums.length; i++) {
      currentMax =
          (nums[i] > currentMax + nums[i]) ? nums[i] : currentMax + nums[i];
      currentMin =
          (nums[i] < currentMin + nums[i]) ? nums[i] : currentMin + nums[i];

      maxSum = (currentMax > maxSum) ? currentMax : maxSum;
      minSum = (currentMin < minSum) ? currentMin : minSum;

      int currentAbsMax = maxSum.abs();
      int currentAbsMin = minSum.abs();
      result = (currentAbsMax > result) ? currentAbsMax : result;
      result = (currentAbsMin > result) ? currentAbsMin : result;
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.maxAbsoluteSum([1, -3, 2, 3, -4])); // 5

  // Test Case 2
  print(solution.maxAbsoluteSum([2, -5, 1, -4, 3, -2])); // 8

  // Test Case 3
  print(solution.maxAbsoluteSum([-1, -2, -3, -4])); // 10
}
