class Solution {
  int countServers(List<List<int>> grid) {
    final int m = grid.length;
    final int n = grid[0].length;

    List<int> rowCount = List.filled(m, 0);
    List<int> colCount = List.filled(n, 0);

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          rowCount[i]++;
          colCount[j]++;
        }
      }
    }
    
    int result = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1 && (rowCount[i] > 1 || colCount[j] > 1)) {
          result++;
        }
      }
    }
    
    return result;
  }
}

// Test cases
void main() {
  final solution = Solution();

  final grid1 = [
    [1, 0],
    [0, 1]
  ];
  print('Test case 1: ${solution.countServers(grid1)}'); // Expected: 0

  final grid2 = [
    [1, 0],
    [1, 1]
  ];
  print('Test case 2: ${solution.countServers(grid2)}'); // Expected: 3
  
  final grid3 = [
    [1, 1, 0, 0],
    [0, 0, 1, 0],
    [0, 0, 1, 0],
    [0, 0, 0, 1]
  ];
  print('Test case 3: ${solution.countServers(grid3)}'); // Expected: 4
}