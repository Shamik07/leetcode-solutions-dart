class Solution {
  String longestPalindrome(String s) {
    if (s.isEmpty) return '';
    int start = 0, end = 0;

    int expandAroundCenter(String s, int left, int right) {
      while (left >= 0 && right < s.length && s[left] == s[right]) {
        left--;
        right++;
      }
      return right - left - 1;
    }

    for (int i = 0; i < s.length; i++) {
      int len1 = expandAroundCenter(s, i, i);
      int len2 = expandAroundCenter(s, i, i + 1);
      int len = len1 > len2 ? len1 : len2;

      if (len > end - start) {
        start = i - (len - 1) ~/ 2;
        end = i + len ~/ 2;
      }
    }

    return s.substring(start, end + 1);
  }
}

// Example Usage
void main() {
  Solution solution = new Solution();

  print(solution.longestPalindrome("babad")); // Output: "bab" or "aba"
  print(solution.longestPalindrome("cbbd")); // Output: "bb"
  print(solution.longestPalindrome("a")); // Output: "a"
  print(solution.longestPalindrome("ac")); // Output: "a" or "c"
}
