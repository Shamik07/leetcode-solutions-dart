List<int> maxPoints(List<List<int>> grid, List<int> queries) {
  int m = grid.length;
  int n = grid[0].length;

  var indexedQueries = List.generate(queries.length, (i) => [queries[i], i]);
  indexedQueries.sort((a, b) => a[0].compareTo(b[0]));

  var result = List<int>.filled(queries.length, 0);

  var cells = <List<int>>[];
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      cells.add([grid[i][j], i, j]);
    }
  }
  cells.sort((a, b) => a[0].compareTo(b[0]));

  var dirs = const [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ];
  var visited = List.generate(m, (_) => List<bool>.filled(n, false));

  var parent = List.generate(m * n, (i) => i);
  var size = List.filled(m * n, 1);

  int find(int x) {
    return parent[x] == x ? x : (parent[x] = find(parent[x]));
  }

  void union(int x, int y) {
    int rx = find(x), ry = find(y);
    if (rx != ry) {
      parent[ry] = rx;
      size[rx] += size[ry];
    }
  }

  int cellIdx = 0;

  for (var query in indexedQueries) {
    int threshold = query[0];
    int originalIdx = query[1];

    while (cellIdx < cells.length && cells[cellIdx][0] < threshold) {
      int r = cells[cellIdx][1], c = cells[cellIdx][2];
      int id = r * n + c;

      visited[r][c] = true;

      for (var dir in dirs) {
        int nr = r + dir[0], nc = c + dir[1];

        if (nr >= 0 && nr < m && nc >= 0 && nc < n && visited[nr][nc]) {
          union(id, nr * n + nc);
        }
      }

      cellIdx++;
    }

    //starting cell is accessible
    if (grid[0][0] < threshold && visited[0][0]) {
      result[originalIdx] = size[find(0)];
    }
  }

  return result;
}

void main() {
  // Example 1
  print(maxPoints([
    [1, 2, 3],
    [2, 5, 7],
    [3, 5, 1]
  ], [
    5,
    6,
    2
  ]));
  // Example 2
  print(maxPoints([
    [5, 2, 1],
    [1, 1, 2]
  ], [
    3
  ]));
  // Failed test case
  print(maxPoints([
    [420766, 806051, 922751],
    [181527, 815280, 904568],
    [952102, 4037, 140319]
  ], [
    352655,
    586228,
    169685,
    541073,
    584647,
    413832,
    576537,
    616413
  ]));
}
