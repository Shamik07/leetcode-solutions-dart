class Solution {
  bool isVowelString(String word) {
    final vowels = {'a', 'e', 'i', 'o', 'u'};
    return vowels.contains(word[0]) && vowels.contains(word[word.length - 1]);
  }

  List<int> countVowelStringsInRanges(
      List<String> words, List<List<int>> queries) {
    int n = words.length;

    List<int> prefixSum = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefixSum[i + 1] = prefixSum[i] + (isVowelString(words[i]) ? 1 : 0);
    }

    List<int> result = [];
    for (var query in queries) {
      int li = query[0];
      int ri = query[1];
      result.add(prefixSum[ri + 1] - prefixSum[li]);
    }

    return result;
  }
}

// Example Usage:
void main() {
  Solution solution = new Solution();
  List<String> words = ["aba", "bcb", "ece", "aa", "e"];
  List<List<int>> queries = [
    [0, 2],
    [1, 4],
    [1, 1]
  ];

  print(
      solution.countVowelStringsInRanges(words, queries)); // Output: [2, 3, 0]
}
