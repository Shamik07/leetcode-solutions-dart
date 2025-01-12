class Solution {
  List<String> wordSubsets(List<String> words1, List<String> words2) {
    List<String> result = [];
    List<int> maxFreq = List.filled(26, 0);

    for (String word in words2) {
      List<int> freq = getFrequency(word);
      for (int i = 0; i < 26; i++) {
        maxFreq[i] = maxFreq[i] > freq[i] ? maxFreq[i] : freq[i];
      }
    }

    for (String word in words1) {
      List<int> freq = getFrequency(word);
      bool isUniversal = true;

      for (int i = 0; i < 26; i++) {
        if (freq[i] < maxFreq[i]) {
          isUniversal = false;
          break;
        }
      }

      if (isUniversal) {
        result.add(word);
      }
    }

    return result;
  }

  List<int> getFrequency(String word) {
    List<int> freq = List.filled(26, 0);
    for (int i = 0; i < word.length; i++) {
      freq[word.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }
    return freq;
  }
}

void main() {
  final solution = Solution();

  List<String> words1 = ["amazon", "apple", "facebook", "google", "leetcode"];
  List<String> words2 = ["e", "o"];
  print('Test 1: ${solution.wordSubsets(words1, words2)}');
  // Output: ["facebook","google","leetcode"]

  List<String> words3 = ["amazon", "apple", "facebook", "google", "leetcode"];
  List<String> words4 = ["l", "e"];
  print('Test 2: ${solution.wordSubsets(words3, words4)}');
  // Output: ["apple","google","leetcode"]

  List<String> words5 = ["warrior", "world", "win"];
  List<String> words6 = ["wr"];
  print('Test 3: ${solution.wordSubsets(words5, words6)}');
  // Output: ["warrior","world"]
}
