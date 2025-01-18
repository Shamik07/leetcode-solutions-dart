class Solution {
  static const List<List<int>> directions = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0],
  ];

  int minCost(List<List<int>> grid) {
    final m = grid.length;
    final n = grid[0].length;

    final pq = <List<int>>[];
    final visited = Set<String>();

    pq.add([0, 0, 0]);

    while (pq.isNotEmpty) {
      pq.sort((a, b) => a[0].compareTo(b[0]));
      final current = pq.removeAt(0);

      final cost = current[0];
      final row = current[1];
      final col = current[2];

      final key = '$row,$col';
      if (visited.contains(key)) continue;
      visited.add(key);

      if (row == m - 1 && col == n - 1) {
        return cost;
      }

      for (int i = 0; i < 4; i++) {
        final newRow = row + directions[i][0];
        final newCol = col + directions[i][1];

        if (newRow < 0 || newRow >= m || newCol < 0 || newCol >= n) {
          continue;
        }

        final newCost = cost + (grid[row][col] - 1 == i ? 0 : 1);

        final newKey = '$newRow,$newCol';
        if (!visited.contains(newKey)) {
          pq.add([newCost, newRow, newCol]);
        }
      }
    }

    return -1;
  }

  void printGrid(List<List<int>> grid) {
    for (var row in grid) {
      print(row.join(' '));
    }
  }
}

void main() {
  final solution = Solution();

  final grid1 = [
    [1, 1, 1, 1],
    [2, 2, 2, 2],
    [1, 1, 1, 1],
    [2, 2, 2, 2]
  ];
  print('Test case 1: ${solution.minCost(grid1)}'); // Expected: 3

  final grid2 = [
    [1, 1, 3],
    [3, 2, 2],
    [1, 1, 4]
  ];
  print('Test case 2: ${solution.minCost(grid2)}'); // Expected: 0

  final grid3 = [
    [1, 2],
    [4, 3]
  ];
  print('Test case 3: ${solution.minCost(grid3)}'); // Expected: 1
}
