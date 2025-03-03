class Solution {
  String smallestNumber(String pattern) {
    List<String> result = [];
    List<int> stack = [];
    int currentDigit = 1;

    for (int i = 0; i < pattern.length; i++) {
      stack.add(currentDigit);
      currentDigit++;

      if (pattern[i] == 'I') {
        while (stack.isNotEmpty) {
          result.add(stack.removeLast().toString());
        }
      }
    }

    // add the last digit
    stack.add(currentDigit);
    while (stack.isNotEmpty) {
      result.add(stack.removeLast().toString());
    }

    return result.join();
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.smallestNumber("IIIDIDDD")); // "123549876"

  // Test Case 2
  print(solution.smallestNumber("DDD")); // "4321"

  // Test Case 3
  print(solution.smallestNumber("IDID")); // "13254"
}
