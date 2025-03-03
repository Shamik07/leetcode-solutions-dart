class Solution {
  String removeOccurrences(String s, String part) {
    while (true) {
      int index = s.indexOf(part);
      if (index == -1) {
        break;
      }
      s = s.substring(0, index) + s.substring(index + part.length);
    }
    return s;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.removeOccurrences("daabcbaabcbc", "abc")); // "dab"

  // Test Case 2
  print(solution.removeOccurrences("axxxxyyyy", "xy")); // "axxxxyyy"

  // Test Case 3
  print(solution.removeOccurrences("ababababab", "abab")); // "ab"
}
