class Solution {
  List<String> stringMatching(List<String> words) {
    final Set<String> result = {};

    words.sort((a, b) => a.length.compareTo(b.length));

    for (int i = 0; i < words.length; i++) {
      for (int j = i + 1; j < words.length; j++) {
        if (words[j].contains(words[i])) {
          result.add(words[i]);
          break;
        }
      }
    }

    return result.toList();
  }
}

void main() {
  final solution = Solution();

  // Example 1
  final result1 = solution.stringMatching(["mass", "as", "hero", "superhero"]);
  print('Example 1: $result1'); // ["as", "hero"]

  // Example 2
  final result2 = solution.stringMatching(["leetcode", "et", "code"]);
  print('Example 2: $result2'); // ["et", "code"]

  // Example 3
  final result3 = solution.stringMatching(["blue", "green", "bu"]);
  print('Example 3: $result3'); // []
}
