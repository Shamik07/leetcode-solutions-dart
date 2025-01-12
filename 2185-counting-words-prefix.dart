class Solution {
  int prefixCount(List<String> words, String pref) {
    int count = 0;

    for (String word in words) {
      if (word.startsWith(pref)) {
        count++;
      }
    }

    return count;
  }
}

void main() {
  final solution = Solution();

  final words1 = ["pay", "attention", "practice", "attend"];
  final pref1 = "at";
  print('1: ${solution.prefixCount(words1, pref1)}'); // Output: 2

  final words2 = ["leetcode", "win", "loops", "success"];
  final pref2 = "code";
  print('2: ${solution.prefixCount(words2, pref2)}'); // Output: 0

  final words3 = ["abc", "acd", "abd", "abx", "bcd"];
  final pref3 = "ab";
  print('3: ${solution.prefixCount(words3, pref3)}'); // Output: 3
}
