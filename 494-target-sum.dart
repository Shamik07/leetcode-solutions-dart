class Solution {
  int findTargetSumWays(List<int> nums, int target) {
    int totalSum = nums.reduce((a, b) => a + b);

    if ((target + totalSum) % 2 != 0 || (target + totalSum) < 0) {
      return 0;
    }

    int subsetSum = (target + totalSum) ~/ 2;

    List<int> dp = List.filled(subsetSum + 1, 0);
    dp[0] = 1;

    for (int num in nums) {
      for (int j = subsetSum; j >= num; j--) {
        dp[j] += dp[j - num];
      }
    }

    return dp[subsetSum];
  }
}

void main() {
  Solution solution = new Solution();

  print(solution.findTargetSumWays([1, 1, 1, 1, 1], 3)); // Output: 5
  print(solution.findTargetSumWays([1], 1)); // Output: 1
}
