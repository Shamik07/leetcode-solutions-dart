class Solution {
  List<List<int>> updateMatrix(List<List<int>> mat) {
    final m = mat.length;
    final n = mat[0].length;
    final dist = List.generate(m, (i) => List.filled(n, 10001));
    final queue = <List<int>>[];

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (mat[i][j] == 0) {
          dist[i][j] = 0;
          queue.add([i, j]);
        }
      }
    }

    final directions = [[0, 1], [1, 0], [0, -1], [-1, 0]];

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      final x = current[0];
      final y = current[1];

      for (final dir in directions) {
        final nx = x + dir[0];
        final ny = y + dir[1];

        if (nx >= 0 && nx < m && ny >= 0 && ny < n) {
          if (dist[nx][ny] > dist[x][y] + 1) {
            dist[nx][ny] = dist[x][y] + 1;
            queue.add([nx, ny]);
          }
        }
      }
    }

    return dist;
  }
}

void main() {
  final solution = Solution();
  
  // Test case 1
  final input1 = [[0,0,0],[0,1,0],[0,0,0]];
  print(solution.updateMatrix(input1));
  
  // Test case 2
  final input2 = [[0,0,0],[0,1,0],[1,1,1]];
  print(solution.updateMatrix(input2));
}