class Solution {
  bool isSubsequence(String s, String t) {
    int sIndex = 0, tIndex = 0;

    while (sIndex < s.length && tIndex < t.length) {
      if (s[sIndex] == t[tIndex]) {
        sIndex++;
      }
      tIndex++;
    }

    return sIndex == s.length;
  }
}

void main() {
  Solution solution = new Solution();

  String s1 = "abc";
  String t1 = "ahbgdc";
  print(solution.isSubsequence(s1, t1)); // Output: true

  String s2 = "axc";
  String t2 = "ahbgdc";
  print(solution.isSubsequence(s2, t2)); // Output: false
}
