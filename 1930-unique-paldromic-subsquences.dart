class Solution {
  int countPalindromicSubsequence(String s) {
    final n = s.length;
    if (n < 3) return 0;

    final firstOccurrence = List.filled(26, -1);
    final lastOccurrence = List.filled(26, -1);

    for (var i = 0; i < n; i++) {
      final charIndex = s.codeUnitAt(i) - 'a'.codeUnitAt(0);
      if (firstOccurrence[charIndex] == -1) {
        firstOccurrence[charIndex] = i;
      }
      lastOccurrence[charIndex] = i;
    }

    var result = 0;
    for (var i = 0; i < 26; i++) {
      if (firstOccurrence[i] == -1) continue;

      final uniqueMiddleChars = Set<int>();
      for (var j = firstOccurrence[i] + 1; j < lastOccurrence[i]; j++) {
        uniqueMiddleChars.add(s.codeUnitAt(j) - 'a'.codeUnitAt(0));
      }
      result += uniqueMiddleChars.length;
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  print(solution.countPalindromicSubsequence("aabca")); // 3
  print(solution.countPalindromicSubsequence("adc")); // 0
  print(solution.countPalindromicSubsequence("bbcbaba")); // 4
  print(solution.countPalindromicSubsequence("aaaa")); // 1
  print(solution.countPalindromicSubsequence("abc")); // 0
}
