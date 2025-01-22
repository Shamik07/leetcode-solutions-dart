class Solution {
  int gridGame(List<List<int>> grid) {
    final int n = grid[0].length;

    List<List<int>> prefixSum = List.generate(2, (i) => List.filled(n + 1, 0));

    for (int i = 0; i < n; i++) {
      prefixSum[0][i + 1] = prefixSum[0][i] + grid[0][i];
      prefixSum[1][i + 1] = prefixSum[1][i] + grid[1][i];
    }

    int result = 9223372036854775807;

    for (int i = 0; i < n; i++) {
      int top = prefixSum[0][n] - prefixSum[0][i + 1];
      int bottom = prefixSum[1][i];
      int secondRobotPoints = top > bottom ? top : bottom;
      result = result < secondRobotPoints ? result : secondRobotPoints;
    }

    return result;
  }
}

// Test cases
void main() {
  final solution = Solution();

  final grid1 = [
    [2, 5, 4],
    [1, 5, 1]
  ];
  print('Test Case 1: ${solution.gridGame(grid1)}'); // Expected: 4

  final grid2 = [
    [3, 3, 1],
    [8, 5, 2]
  ];
  print('Test Case 2: ${solution.gridGame(grid2)}'); // Expected: 4

  final grid3 = [
    [1, 3, 1, 15],
    [1, 3, 3, 1]
  ];
  print('Test Case 3: ${solution.gridGame(grid3)}'); // Expected: 7
}
