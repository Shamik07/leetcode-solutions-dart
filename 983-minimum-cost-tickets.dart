class Solution {
  int max(int a, int b) => (a > b) ? a : b;

  int mincostTickets(List<int> days, List<int> costs) {
    final Set<int> travelDays = days.toSet();
    final List<int> dp = List.filled(366, 0);

    for (int day = 1; day <= 365; day++) {
      if (!travelDays.contains(day)) {
        dp[day] = dp[day - 1];
      } else {
        dp[day] = [
          dp[day - 1] + costs[0],
          dp[max(0, day - 7)] + costs[1],
          dp[max(0, day - 30)] + costs[2],
        ].reduce((a, b) => a < b ? a : b);
      }
    }

    return dp[days.last];
  }
}

void main() {
  Solution solution = new Solution();
  print(solution.mincostTickets([1, 4, 6, 7, 8, 20], [2, 7, 15])); // Output: 11
  print(solution.mincostTickets(
      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], [2, 7, 15])); // Output: 17
}
