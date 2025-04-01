import 'dart:math';

class Solution {
  int mostPoints(List<List<int>> questions) {
    int n = questions.length;
    List<int> dp = List<int>.filled(n + 1, 0);

    for (int i = n - 1; i >= 0; i--) {
      int points = questions[i][0];
      int brainpower = questions[i][1];

      int nextQuestionIndex = i + brainpower + 1;
      int pointsFromNext = (nextQuestionIndex < n) ? dp[nextQuestionIndex] : 0;
      int solveOption = points + pointsFromNext;

      // same as starting from question i + 1
      int skipOption = dp[i + 1];
      dp[i] = max(solveOption, skipOption);
    }

    return dp[0];
  }
}

void main() {
  Solution sol = Solution();

  // Example 1
  List<List<int>> questions1 = [
    [3, 2],
    [4, 3],
    [4, 4],
    [2, 5]
  ];
  int result1 = sol.mostPoints(questions1);
  print("Example 1 Output: $result1"); // Expected output: 5

  print("-" * 20);

  // Example 2
  List<List<int>> questions2 = [
    [1, 1],
    [2, 2],
    [3, 3],
    [4, 4],
    [5, 5]
  ];
  int result2 = sol.mostPoints(questions2);
  print("Example 2 Output: $result2"); // Expected output: 7
}
