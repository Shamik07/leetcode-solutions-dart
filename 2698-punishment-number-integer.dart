class Solution {
  int punishmentNumber(int n) {
    int result = 0;

    for (int i = 1; i <= n; i++) {
      int square = i * i;
      if (canPartition(square.toString(), i)) {
        result += square;
      }
    }

    return result;
  }

  bool canPartition(String s, int target) {
    return backtrack(s, 0, 0, target);
  }

  bool backtrack(String s, int index, int currentSum, int target) {
    if (index == s.length) {
      return currentSum == target;
    }

    for (int i = index; i < s.length; i++) {
      String substring = s.substring(index, i + 1);
      int num = int.parse(substring);
      if (backtrack(s, i + 1, currentSum + num, target)) {
        return true;
      }
    }

    return false;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.punishmentNumber(10)); // 182

  // Test Case 2
  print(solution.punishmentNumber(20)); // 1478

  // Test Case 3
  print(solution.punishmentNumber(30)); // 10857
}
