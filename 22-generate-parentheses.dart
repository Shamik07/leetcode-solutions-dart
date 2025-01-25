class Solution {
  List<String> generateParenthesis(int n) {
    List<String> result = [];
    _generate(n, n, '', result);
    return result;
  }

  void _generate(
      int openCount, int closeCount, String current, List<String> result) {
    if (openCount == 0 && closeCount == 0) {
      result.add(current);
      return;
    }

    if (openCount > 0) {
      _generate(openCount - 1, closeCount, current + '(', result);
    }

    if (closeCount > openCount) {
      _generate(openCount, closeCount - 1, current + ')', result);
    }
  }
}

void main() {
  final solution = Solution();

  print(
      'n = 3: ${solution.generateParenthesis(3)}'); // Expected: ["((()))","(()())","(())()","()(())","()()()"]

  print('n = 1: ${solution.generateParenthesis(1)}'); // Expected: ["()"]

  print(
      'n = 2: ${solution.generateParenthesis(2)}'); // Expected: ["(())","()()"]
}
