class Solution {
  int countUnguarded(int m, int n, List<List<int>> guards, List<List<int>> walls) {
    int ans = 0;

    List<List<String>> grid = List.generate(m, (_) => List.generate(n, (_) => '0'));

    // Mark guards and walls
    for (var guard in guards) {
      grid[guard[0]][guard[1]] = 'G';
    }

    for (var wall in walls) {
      grid[wall[0]][wall[1]] = 'W';
    }

    void markDirection(int x, int y, int dx, int dy) {
      int i = x + dx, j = y + dy;
      while (i >= 0 && i < m && j >= 0 && j < n && grid[i][j] != 'W' && grid[i][j] != 'G') {
        grid[i][j] = 'X'; // Mark as guarded
        i += dx;
        j += dy;
      }
    }

    for (var guard in guards) {
      int x = guard[0];
      int y = guard[1];
      markDirection(x, y, 0, 1);  // R
      markDirection(x, y, 0, -1); // L
      markDirection(x, y, 1, 0);  // D
      markDirection(x, y, -1, 0); // U
    }

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == '0') {
          ans++;
        }
      }
    }

    return ans;
  }
}




void main() {
  Solution solution = Solution();

  // Example 1
  int m1 = 4;
  int n1 = 6;
  List<List<int>> guards1 = [
    [0, 0],
    [1, 1],
    [2, 3]
  ];
  List<List<int>> walls1 = [
    [0, 1],
    [2, 2],
    [1, 4]
  ];
  int result1 = solution.countUnguarded(m1, n1, guards1, walls1);
  print('Example 1 - Unguarded cells: $result1'); // Expected: 7

  // Example 2
  int m2 = 3;
  int n2 = 3;
  List<List<int>> guards2 = [
    [1, 1]
  ];
  List<List<int>> walls2 = [
    [0, 1],
    [1, 0],
    [2, 1],
    [1, 2]
  ];
  int result2 = solution.countUnguarded(m2, n2, guards2, walls2);
  print('Example 2 - Unguarded cells: $result2'); // Expected: 4
}

