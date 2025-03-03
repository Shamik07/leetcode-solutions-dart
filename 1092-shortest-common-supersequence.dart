class Solution {
  String shortestCommonSupersequence(String str1, String str2) {
    int m = str1.length;
    int n = str2.length;

    List<List<int>> dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));

    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (str1[i - 1] == str2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1] + 1;
        } else {
          dp[i][j] = dp[i - 1][j] > dp[i][j - 1] ? dp[i - 1][j] : dp[i][j - 1];
        }
      }
    }

    int i = m, j = n;
    StringBuffer scs = StringBuffer();

    while (i > 0 && j > 0) {
      if (str1[i - 1] == str2[j - 1]) {
        scs.write(str1[i - 1]);
        i--;
        j--;
      } else if (dp[i - 1][j] > dp[i][j - 1]) {
        scs.write(str1[i - 1]);
        i--;
      } else {
        scs.write(str2[j - 1]);
        j--;
      }
    }

    while (i > 0) {
      scs.write(str1[i - 1]);
      i--;
    }
    while (j > 0) {
      scs.write(str2[j - 1]);
      j--;
    }

    return scs.toString().split('').reversed.join();
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.shortestCommonSupersequence("abac", "cab")); // "cabac"

  // Test Case 2
  print(solution.shortestCommonSupersequence(
      "aaaaaaaa", "aaaaaaaa")); // "aaaaaaaa"

  // Test Case 3
  print(solution.shortestCommonSupersequence("abc", "def")); // "abcdef"
}
