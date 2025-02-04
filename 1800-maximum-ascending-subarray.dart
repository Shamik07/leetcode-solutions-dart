class Solution {
  int maxAscendingSum(List<int> nums) {
    if (nums.isEmpty) return 0;
    if (nums.length == 1) return nums[0];

    int maxSum = nums[0];
    int currentSum = nums[0];

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        currentSum += nums[i];
      } else {
        currentSum = nums[i];
      }

      maxSum = max(maxSum, currentSum);
    }

    return maxSum;
  }

  int max(int a, int b) => a > b ? a : b;
}

void main() {
  final solution = Solution();
  final testCases = [
    [10, 20, 30, 5, 10, 50], // Expected: 65
    [10, 20, 30, 40, 50], // Expected: 150
    [12, 17, 15, 13, 10, 11, 12] // Expected: 33
  ];

  for (int i = 0; i < testCases.length; i++) {
    final result = solution.maxAscendingSum(testCases[i]);
    print('Test case ${i + 1}:');
    print('Input: ${testCases[i]}');
    print('Output: $result\n');
  }
}
