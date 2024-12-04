class Solution {
  bool canMakeSubsequence(String str1, String str2) {
        int n = str1.length;
        int m = str2.length;

        if (m > n) {
            return false;
        }

        int j = 0;

        for (int i = 0; i < n && j < m; i++) {
            // Check match or increment
            if (str1[i] == str2[j] || 
                ((str1[i].codeUnitAt(0) + 1 - 'a'.codeUnitAt(0)) % 26 + 'a'.codeUnitAt(0)) == str2[j].codeUnitAt(0)) {
            j++;
            }
        }

        return j == m;
    }
}

void main() {
  Solution solution = new Solution();
  // Test cases
  print(solution.canMakeSubsequence("abc", "ad")); // true
  print(solution.canMakeSubsequence("zc", "ad")); // true
  print(solution.canMakeSubsequence("ab", "d"));  // false
}