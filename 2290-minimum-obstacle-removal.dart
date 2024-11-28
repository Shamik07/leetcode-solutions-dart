import 'dart:collection';

int minimumObstacles(List<List<int>> grid) {
  final m = grid.length;
  final n = grid[0].length;

  final directions = [
    [0, 1],  // right
    [1, 0],  // down
    [0, -1], // left
    [-1, 0]  // up
  ];

  // BFS.
  final deque = DoubleLinkedQueue<List<int>>();
  // Distance matrix to track minimum removals to reach each cell.
  final dist = List.generate(m, (_) => List.filled(n, double.maxFinite.toInt()));

  deque.addFirst([0, 0]);
  dist[0][0] = 0;

  while (deque.isNotEmpty) {
    final current = deque.removeFirst();
    final x = current[0];
    final y = current[1];

    for (var dir in directions) {
      final nx = x + dir[0];
      final ny = y + dir[1];

      if (nx >= 0 && nx < m && ny >= 0 && ny < n) {
        final newDist = dist[x][y] + grid[nx][ny];
        if (newDist < dist[nx][ny]) {
          dist[nx][ny] = newDist;
          // If it's an obstacle, add to the back of the deque; otherwise, to the front.
          if (grid[nx][ny] == 1) {
            deque.addLast([nx, ny]);
          } else {
            deque.addFirst([nx, ny]);
          }
        }
      }
    }
  }

  return dist[m - 1][n - 1];
}

void main() {
  final grid1 = [
    [0, 1, 1],
    [1, 1, 0],
    [1, 1, 0]
  ];
  print(minimumObstacles(grid1)); // Output: 2

  final grid2 = [
    [0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 0, 0, 1, 0]
  ];
  print(minimumObstacles(grid2)); // Output: 0
}
