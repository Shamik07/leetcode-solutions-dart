class Solution {
  int lenLongestFibSubseq(List<int> arr) {
    int n = arr.length;
    Map<int, int> indexMap = {};
    for (int i = 0; i < n; i++) {
      indexMap[arr[i]] = i;
    }

    int maxLen = 0;
    List<List<int>> dp = List.generate(n, (_) => List.filled(n, 2));

    for (int j = 1; j < n; j++) {
      for (int i = 0; i < j; i++) {
        int target = arr[j] - arr[i];
        if (indexMap.containsKey(target)) {
          int k = indexMap[target]!;
          if (k < i) {
            dp[i][j] = dp[k][i] + 1;
            if (dp[i][j] > maxLen) {
              maxLen = dp[i][j];
            }
          }
        }
      }
    }

    return maxLen >= 3 ? maxLen : 0;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.lenLongestFibSubseq([1, 2, 3, 4, 5, 6, 7, 8])); // 5

  // Test Case 2
  print(solution.lenLongestFibSubseq([1, 3, 7, 11, 12, 14, 18])); // 3

  // Test Case 3
  print(solution
      .lenLongestFibSubseq([2, 4, 7, 8, 9, 10, 14, 15, 18, 23, 32, 50])); // 5
}
