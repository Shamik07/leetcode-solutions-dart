class Solution {
  bool isMatch(String s, String p) {
    List<List<bool>> dp =
        List.generate(s.length + 1, (_) => List.filled(p.length + 1, false));
    dp[0][0] = true;

    for (int j = 1; j <= p.length; j++) {
      if (p[j - 1] == '*') {
        dp[0][j] = dp[0][j - 2];
      }
    }

    for (int i = 1; i <= s.length; i++) {
      for (int j = 1; j <= p.length; j++) {
        if (p[j - 1] == s[i - 1] || p[j - 1] == '.') {
          dp[i][j] = dp[i - 1][j - 1];
        } else if (p[j - 1] == '*') {
          dp[i][j] = dp[i][j - 2] ||
              (dp[i - 1][j] && (s[i - 1] == p[j - 2] || p[j - 2] == '.'));
        }
      }
    }

    return dp[s.length][p.length];
  }
}

void main() {
  Solution sol = Solution();
  print(sol.isMatch("aa", "a")); // false
  print(sol.isMatch("aa", "a*")); // true
  print(sol.isMatch("ab", ".*")); // true
  print(sol.isMatch("mississippi", "mis*is*p*.")); // true
}
