class Solution {
  List<int> minOperations(String boxes) {
    int n = boxes.length;
    List<int> answer = List.filled(n, 0);
    int balls = 0, ops = 0;

    for (int i = 0; i < n; i++) {
      answer[i] += ops;
      balls += boxes[i] == '1' ? 1 : 0;
      ops += balls;
    }

    balls = 0;
    ops = 0;

    for (int i = n - 1; i >= 0; i--) {
      answer[i] += ops;
      balls += boxes[i] == '1' ? 1 : 0;
      ops += balls;
    }
    return answer;
  }
}

void main() {
  final solution = Solution();

  // Example 1
  print(solution.minOperations("110")); // Output: [1,1,3]

  // Example 2
  print(solution.minOperations("001011")); // Output: [11,8,5,4,3,4]
}
