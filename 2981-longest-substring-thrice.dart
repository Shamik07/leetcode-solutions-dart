class Solution {
  int maximumLength(String s) {
    int n = s.length;

    if (n < 3) return -1;

    int maxLength = -1;
    Map<String, int> frequencyMap = {};

    bool isSpecial(String substring) {
      return substring.split('').toSet().length == 1;
    }

    for (int len = 1; len <= n; len++) {
      for (int i = 0; i <= n - len; i++) {
        String substring = s.substring(i, i + len);

        if (isSpecial(substring)) {
          frequencyMap[substring] = (frequencyMap[substring] ?? 0) + 1;

          if (frequencyMap[substring]! >= 3) {
            maxLength = len > maxLength ? len : maxLength;
          }
        }
      }
    }

    return maxLength;
  }
}

void main() {
  Solution solution = Solution();

  // Test cases
  print(solution.maximumLength("aaaa")); // Output: 2
  print(solution.maximumLength("abcdef")); // Output: -1
  print(solution.maximumLength("abcaba")); // Output: 1
  print(solution.maximumLength("zzzzz")); // Output: 3
}
