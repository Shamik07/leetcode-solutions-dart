class Solution {
  int countGoodStrings(int low, int high, int zero, int one) {
    const int MOD = 1000000007;
    List<int> dp = List.filled(high + 1, 0);
    dp[0] = 1;

    for (int i = 1; i <= high; i++) {
      if (i >= zero) {
        dp[i] = (dp[i] + dp[i - zero]) % MOD;
      }
      if (i >= one) {
        dp[i] = (dp[i] + dp[i - one]) % MOD;
      }
    }

    int result = 0;
    for (int i = low; i <= high; i++) {
      result = (result + dp[i]) % MOD;
    }

    return result;
  }
}

// Example usage:
void main() {
  Solution solution = new Solution();
  print(solution.countGoodStrings(3, 3, 1, 1)); // Output: 8
  print(solution.countGoodStrings(2, 3, 1, 2)); // Output: 5
}
