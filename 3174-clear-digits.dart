class Solution {
  String clearDigits(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      if (char.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
          char.codeUnitAt(0) <= '9'.codeUnitAt(0)) {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
      } else {
        stack.add(char);
      }
    }

    return stack.join();
  }
}

void main() {
  // Test Case 1
  final solution = Solution();
  print(solution.clearDigits("abc34def56")); // "abcdef"

  // Test Case 2
  print(solution.clearDigits("a1b2c3")); // "abc"

  // Test Case 3
  print(solution.clearDigits("12345")); // ""
}
