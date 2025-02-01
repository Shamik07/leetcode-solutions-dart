class UnionFind {
  late List<int> parent;
  late List<int> size;

  UnionFind(int n) {
    parent = List.generate(n, (i) => i);
    size = List.filled(n, 1);
  }

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]); // Path compression
    }
    return parent[x];
  }

  void union(int x, int y) {
    int rootX = find(x);
    int rootY = find(y);

    if (rootX != rootY) {
      parent[rootY] = rootX;
      size[rootX] += size[rootY];
    }
  }

  int getSize(int x) {
    return size[find(x)];
  }
}

class Solution {
  int largestIsland(List<List<int>> grid) {
    final int n = grid.length;
    final UnionFind uf = UnionFind(n * n);
    final List<int> directions = [-1, 0, 1, 0, -1];

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          for (int d = 0; d < 4; d++) {
            int ni = i + directions[d];
            int nj = j + directions[d + 1];

            if (ni >= 0 && ni < n && nj >= 0 && nj < n && grid[ni][nj] == 1) {
              uf.union(i * n + j, ni * n + nj);
            }
          }
        }
      }
    }

    int maxSize = 0;
    for (int i = 0; i < n * n; i++) {
      maxSize = max(maxSize, uf.getSize(i));
    }
    if (maxSize == n * n) return maxSize;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 0) {
          Set<int> connectedRoots = {};
          int size = 1;

          // Check all 4 directions
          for (int d = 0; d < 4; d++) {
            int ni = i + directions[d];
            int nj = j + directions[d + 1];

            if (ni >= 0 && ni < n && nj >= 0 && nj < n && grid[ni][nj] == 1) {
              int root = uf.find(ni * n + nj);
              if (!connectedRoots.contains(root)) {
                size += uf.getSize(root);
                connectedRoots.add(root);
              }
            }
          }
          maxSize = max(maxSize, size);
        }
      }
    }

    return maxSize;
  }

  int max(int a, int b) => a > b ? a : b;
}

void main() {
  final solution = Solution();

  // Test cases
  final testCases = [
    [
      [1, 0],
      [0, 1]
    ],
    [
      [1, 1],
      [1, 0]
    ],
    [
      [1, 1],
      [1, 1]
    ]
  ];

  for (int i = 0; i < testCases.length; i++) {
    final result = solution.largestIsland(testCases[i]);
    print('Test case ${i + 1}:');
    print('Input grid: ${testCases[i]}');
    print('Output: $result\n');
  }
}
