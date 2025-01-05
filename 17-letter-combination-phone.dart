class Solution {
  static const Map<String, String> digitToLetters = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz'
  };

  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) return [];

    final result = <String>[];

    void backtrack(int index, String current) {
      if (index == digits.length) {
        result.add(current);
        return;
      }

      for (var letter in digitToLetters[digits[index]]!.split('')) {
        backtrack(index + 1, current + letter);
      }
    }

    backtrack(0, '');
    return result;
  }
}

void main() {
  final solution = Solution();
  print(solution.letterCombinations(
      "23")); // ["ad","ae","af","bd","be","bf","cd","ce","cf"]
  print(solution.letterCombinations("")); // []
  print(solution.letterCombinations("2")); // ["a","b","c"]
}
