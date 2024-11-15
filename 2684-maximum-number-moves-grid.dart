import 'dart:math';

class Solution {
  int maxMoves(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    List<List<int>> dp = List.generate(m, (_) => List.filled(n, -1));

    int dfs(int row, int col) {
      // If out of bounds or at an already calculated cell
      if (col == n - 1) return 0; // Last column
      if (dp[row][col] != -1) return dp[row][col];

      int maxMoves = 0;
      List<List<int>> directions = [
        [-1, 1], // Top-right
        [0, 1], // Right
        [1, 1] // Bottom-right
      ];

      for (var dir in directions) {
        int newRow = row + dir[0];
        int newCol = col + dir[1];

        if (newRow >= 0 &&
            newRow < m &&
            newCol < n &&
            grid[newRow][newCol] > grid[row][col]) {
          maxMoves = max(maxMoves, 1 + dfs(newRow, newCol));
        }
      }

      dp[row][col] = maxMoves;
      return dp[row][col];
    }

    int result = 0;
    for (int row = 0; row < m; row++) {
      result = max(result, dfs(row, 0));
      // Start DFS from each cell in the first column
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();
  List<List<int>> grid1 = [
    [2, 4, 3, 5],
    [5, 4, 9, 3],
    [3, 4, 2, 11],
    [10, 9, 13, 15]
  ];
  print(solution.maxMoves(grid1)); // Output: 3

  List<List<int>> grid2 = [
    [3, 2, 4],
    [2, 1, 9],
    [1, 1, 7]
  ];
  print(solution.maxMoves(grid2)); // Output: 0
}
