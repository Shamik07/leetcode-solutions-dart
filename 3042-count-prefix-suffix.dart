class Solution {
  int countPrefixSuffixPairs(List<String> words) {
    int count = 0;

    for (int i = 0; i < words.length; i++) {
      for (int j = i + 1; j < words.length; j++) {
        if (isPrefixAndSuffix(words[i], words[j])) {
          count++;
        }
      }
    }

    return count;
  }

  bool isPrefixAndSuffix(String str1, String str2) {
    if (str1.length > str2.length) {
      return false;
    }

    bool isPrefix = str2.startsWith(str1);
    bool isSuffix = str2.endsWith(str1);

    return isPrefix && isSuffix;
  }
}

void main() {
  final solution = Solution();

  final words1 = ["a", "aba", "ababa", "aa"];
  print('1: ${solution.countPrefixSuffixPairs(words1)}'); // Output: 4

  final words2 = ["pa", "papa", "ma", "mama"];
  print('2: ${solution.countPrefixSuffixPairs(words2)}'); // Output: 2

  final words3 = ["abab", "ab"];
  print('3: ${solution.countPrefixSuffixPairs(words3)}'); // Output: 0
}
