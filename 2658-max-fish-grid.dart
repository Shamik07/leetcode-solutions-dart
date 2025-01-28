class Solution {
  int findMaxFish(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int maxFish = 0;

    List<List<int>> directions = [
      [0, 1], // right
      [1, 0], // down
      [0, -1], // left
      [-1, 0] // up
    ];

    int dfs(int r, int c) {
      if (r < 0 || r >= m || c < 0 || c >= n || grid[r][c] == 0) {
        return 0;
      }
      int fish = grid[r][c];
      grid[r][c] = 0;
      for (var dir in directions) {
        fish += dfs(r + dir[0], c + dir[1]);
      }
      return fish;
    }

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] > 0) {
          int currentFish = dfs(i, j);
          if (currentFish > maxFish) {
            maxFish = currentFish;
          }
        }
      }
    }

    return maxFish;
  }
}

void main() {
  Solution solution = Solution();

  List<List<int>> grid1 = [
    [0, 2, 1, 0],
    [4, 0, 0, 3],
    [1, 0, 0, 4],
    [0, 3, 2, 0]
  ];
  print(solution.findMaxFish(grid1)); // Output: 7

  List<List<int>> grid2 = [
    [1, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 1]
  ];
  print(solution.findMaxFish(grid2)); // Output: 1
}
