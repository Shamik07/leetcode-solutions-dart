class UnionFind {
  List<int> parent;
  List<int> rank;
  int count;

  UnionFind(int n)
      : parent = List.generate(n, (i) => i),
        rank = List.filled(n, 0),
        count = n;

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int x, int y) {
    int rootX = find(x);
    int rootY = find(y);

    if (rootX != rootY) {
      if (rank[rootX] < rank[rootY]) {
        // swap
        int temp = rootX;
        rootX = rootY;
        rootY = temp;
      }
      parent[rootY] = rootX;
      if (rank[rootX] == rank[rootY]) {
        rank[rootX]++;
      }
      count--;
    }
  }
}

class Solution {
  int regionsBySlashes(List<String> grid) {
    int n = grid.length;
    UnionFind uf = UnionFind(4 * n * n);

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (i > 0) uf.union(getPos(n, i - 1, j, 2), getPos(n, i, j, 0));
        if (j > 0) uf.union(getPos(n, i, j - 1, 1), getPos(n, i, j, 3));

        // current cell
        if (grid[i][j] != '/') {
          uf.union(getPos(n, i, j, 0), getPos(n, i, j, 1));
          uf.union(getPos(n, i, j, 2), getPos(n, i, j, 3));
        }
        if (grid[i][j] != '\\') {
          uf.union(getPos(n, i, j, 0), getPos(n, i, j, 3));
          uf.union(getPos(n, i, j, 1), getPos(n, i, j, 2));
        }
      }
    }
    return uf.count;
  }

  int getPos(int n, int row, int col, int k) {
    return 4 * (row * n + col) + k;
  }
}

void main() {
  final solution = Solution();

  // Example 1
  final result1 = solution.regionsBySlashes([" /", "/ "]);
  print('Example 1: $result1'); // Output: 2

  // Example 2
  final result2 = solution.regionsBySlashes([" /", "  "]);
  print('Example 2: $result2'); // Output: 1

  // Example 3
  final result3 = solution.regionsBySlashes(["/\\", "\\/"]);
  print('Example 3: $result3'); // Output: 5
}
