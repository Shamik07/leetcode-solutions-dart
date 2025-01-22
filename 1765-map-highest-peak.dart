class Solution {
  List<List<int>> highestPeak(List<List<int>> isWater) {
    final m = isWater.length;
    final n = isWater[0].length;
    final height = List.generate(m, (i) => List.filled(n, -1));
    final queue = List<List<int>>.empty(growable: true);

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (isWater[i][j] == 1) {
          height[i][j] = 0;
          queue.add([i, j]);
        }
      }
    }

    final directions = [
      [1, 0], // down
      [0, 1], // right
      [-1, 0], // up
      [0, -1] // left
    ];

    int queueIndex = 0;
    while (queueIndex < queue.length) {
      final current = queue[queueIndex++];
      final x = current[0], y = current[1];

      for (final dir in directions) {
        final nx = x + dir[0];
        final ny = y + dir[1];

        if (nx >= 0 && nx < m && ny >= 0 && ny < n && height[nx][ny] == -1) {
          height[nx][ny] = height[x][y] + 1;
          queue.add([nx, ny]);
        }
      }
    }

    return height;
  }
}

void main() {
  final solution = Solution();

  final input1 = [
    [0, 1],
    [0, 0]
  ];
  print(solution.highestPeak(input1)); // [[1,0],[2,1]]

  final input2 = [
    [0, 0, 1],
    [1, 0, 0],
    [0, 0, 0]
  ];
  print(solution.highestPeak(input2)); // [[1,1,0],[0,1,1],[1,2,2]]
}
