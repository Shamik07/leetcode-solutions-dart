class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    Map<String, String> bracketMap = {
      ')': '(',
      '}': '{',
      ']': '[',
    };

    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      if (bracketMap.containsValue(char)) {
        //opening bracket
        stack.add(char);
      } else if (bracketMap.containsKey(char)) {
        // closing bracket
        if (stack.isEmpty || stack.removeLast() != bracketMap[char]) {
          return false;
        }
      }
    }

    return stack.isEmpty;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.isValid("()")); // Output: true
  print(sol.isValid("()[]{}")); // Output: true
  print(sol.isValid("(]")); // Output: false
  print(sol.isValid("([])")); // Output: true
}
