class Solution {
  List<int> findRedundantConnection(List<List<int>> edges) {
    int n = edges.length;
    List<int> parent = List<int>.generate(n + 1, (index) => index);

    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }

    for (var edge in edges) {
      int u = edge[0], v = edge[1];
      int rootU = find(u), rootV = find(v);
      if (rootU == rootV) {
        return edge;
      }
      parent[rootV] = rootU;
    }

    return [];
  }
}

void main() {
  Solution solution = Solution();

  List<List<int>> edges1 = [
    [1, 2],
    [1, 3],
    [2, 3]
  ];
  print(solution.findRedundantConnection(edges1)); // Output: [2, 3]

  List<List<int>> edges2 = [
    [1, 2],
    [2, 3],
    [3, 4],
    [1, 4],
    [1, 5]
  ];
  print(solution.findRedundantConnection(edges2)); // Output: [1, 4]
}
