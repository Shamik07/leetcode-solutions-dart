class Solution {
  int isPrefixOfWord(String sentence, String searchWord) {
    int wordIndex = 1;
    int i = 0;
    int n = sentence.length;

    while (i < n) {
      int start = i;

      while (i < n && sentence[i] != ' ') {
        i++;
      }

      if (sentence.substring(start, i).startsWith(searchWord)) {
        return wordIndex;
      }

      wordIndex++;
      i++;
    }

    return -1;
  }
}

void main() {
  Solution solution = new Solution();
  print(solution.isPrefixOfWord("i love eating burger", "burg")); // Output: 4
  print(solution.isPrefixOfWord(
      "this problem is an easy problem", "pro")); // Output: 2
  print(solution.isPrefixOfWord("i am tired", "you")); // Output: -1
}
