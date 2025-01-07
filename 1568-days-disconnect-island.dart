class Solution {
  final List<List<int>> directions = [
    [-1, 0], // up
    [1, 0], // down
    [0, -1], // left
    [0, 1] // right
  ];

  int minDays(List<List<int>> grid) {
    if (countIslands(grid) != 1) return 0;

    int m = grid.length;
    int n = grid[0].length;

    //check
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          grid[i][j] = 0; // remove
          if (countIslands(grid) != 1) return 1;
          grid[i][j] = 1; // restore
        }
      }
    }

    // can't disconnect with one cell, need 2 days
    return 2;
  }

  int countIslands(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    List<List<bool>> visited = List.generate(m, (_) => List.filled(n, false));
    int count = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1 && !visited[i][j]) {
          dfs(grid, i, j, visited);
          count++;
        }
      }
    }

    return count;
  }

  void dfs(List<List<int>> grid, int row, int col, List<List<bool>> visited) {
    int m = grid.length;
    int n = grid[0].length;

    visited[row][col] = true;

    for (var dir in directions) {
      int newRow = row + dir[0];
      int newCol = col + dir[1];

      if (newRow >= 0 &&
          newRow < m &&
          newCol >= 0 &&
          newCol < n &&
          grid[newRow][newCol] == 1 &&
          !visited[newRow][newCol]) {
        dfs(grid, newRow, newCol, visited);
      }
    }
  }
}

void main() {
  final solution = Solution();

  // Example 1
  final grid1 = [
    [0, 1, 1, 0],
    [0, 1, 1, 0],
    [0, 0, 0, 0]
  ];
  print('Example 1: ${solution.minDays(grid1)}'); // Output: 2

  // Example 2
  final grid2 = [
    [1, 1]
  ];
  print('Example 2: ${solution.minDays(grid2)}'); // Output: 2

  // Example 3
  final grid3 = [
    [1, 1, 0],
    [1, 1, 0],
    [0, 0, 0]
  ];
  print('Example 3: ${solution.minDays(grid3)}'); // Output: 1
}
