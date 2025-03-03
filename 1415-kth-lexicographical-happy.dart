class Solution {
  String getHappyString(int n, int k) {
    String result = "";
    int count = 0;

    void backtrack(String current) {
      if (current.length == n) {
        count++;
        if (count == k) {
          result = current;
        }
        return;
      }

      for (String char in ['a', 'b', 'c']) {
        if (current.isEmpty || current[current.length - 1] != char) {
          backtrack(current + char);
          if (result.isNotEmpty) {
            return;
          }
        }
      }
    }

    backtrack("");
    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.getHappyString(1, 3)); // "c"

  // Test Case 2
  print(solution.getHappyString(3, 9)); // "cab"

  // Test Case 3
  print(solution.getHappyString(2, 7)); // ""
}
