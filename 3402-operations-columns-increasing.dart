class Solution {
  int minimumOperations(List<List<int>> grid) {
    int m = grid.length, n = grid[0].length;
    int operations = 0;

    for (int j = 0; j < n; j++) {
      for (int i = 1; i < m; i++) {
        if (grid[i][j] <= grid[i - 1][j]) {
          operations += grid[i - 1][j] - grid[i][j] + 1;
          grid[i][j] = grid[i - 1][j] + 1;
        }
      }
    }

    return operations;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.minimumOperations([
    [3, 2],
    [1, 3],
    [3, 4],
    [0, 1]
  ])); // 15
  print(sol.minimumOperations([
    [3, 2, 1],
    [2, 1, 0],
    [1, 2, 3]
  ])); // 12
}
