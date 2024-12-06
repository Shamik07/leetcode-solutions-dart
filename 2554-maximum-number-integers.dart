class Solution {
  int maxCount(List<int> banned, int n, int maxSum) {
    final bannedSet = banned.toSet();

    int currentSum = 0;
    int count = 0;

    for (int i = 1; i <= n; i++) {
      // Skip
      if (bannedSet.contains(i)) continue;

      // Check
      if (currentSum + i > maxSum) break;

      // Add
      currentSum += i;
      count++;
    }

    return count;
  }
}

void main() {
  Solution solution = new Solution();

  print(solution.maxCount([1, 6, 5], 5, 6)); // Output: 2
  print(solution.maxCount([1, 2, 3, 4, 5, 6, 7], 8, 1)); // Output: 0
  print(solution.maxCount([11], 7, 50)); // Output: 7
}
