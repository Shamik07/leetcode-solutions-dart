const int MOD = 1000000007;

class Solution {
  int numWays(List<String> words, String target) {
    int m = words[0].length;
    int n = target.length;

    List<Map<String, int>> freq = List.generate(m, (_) => {});
    for (var word in words) {
      for (int i = 0; i < word.length; i++) {
        freq[i][word[i]] = (freq[i][word[i]] ?? 0) + 1;
      }
    }

    List<List<int>> dp = List.generate(n, (_) => List.filled(m, -1));

    int dfs(int i, int j) {
      if (i == n) return 1;
      if (j == m) return 0;
      if (dp[i][j] != -1) return dp[i][j];

      int ways = dfs(i, j + 1) % MOD;

      String char = target[i];
      if (freq[j].containsKey(char)) {
        ways = (ways + (freq[j][char]! * dfs(i + 1, j + 1)) % MOD) % MOD;
      }

      return dp[i][j] = ways;
    }

    return dfs(0, 0);
  }
}

void main() {
  Solution solution = new Solution();

  print(solution.numWays(["acca", "bbbb", "caca"], "aba")); // Output: 6
  print(solution.numWays(["abba", "baab"], "bab")); // Output: 4
}
