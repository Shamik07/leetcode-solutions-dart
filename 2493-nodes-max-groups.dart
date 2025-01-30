import 'dart:collection';

class Solution {
  int magnificentSets(int n, List<List<int>> edges) {
    List<List<int>> adj = List.generate(n + 1, (_) => []);
    for (var edge in edges) {
      int u = edge[0], v = edge[1];
      adj[u].add(v);
      adj[v].add(u);
    }

    // is bipartite
    List<int> color = List.filled(n + 1, -1);
    bool isBipartite = true;
    for (int i = 1; i <= n; i++) {
      if (color[i] == -1) {
        color[i] = 0;
        Queue<int> queue = Queue();
        queue.add(i);
        while (queue.isNotEmpty) {
          int u = queue.removeFirst();
          for (int v in adj[u]) {
            if (color[v] == -1) {
              color[v] = color[u] ^ 1;
              queue.add(v);
            } else if (color[v] == color[u]) {
              isBipartite = false;
              break;
            }
          }
          if (!isBipartite) break;
        }
      }
      if (!isBipartite) break;
    }

    if (!isBipartite) return -1;

    List<bool> visited = List.filled(n + 1, false);
    int totalGroups = 0;

    for (int i = 1; i <= n; i++) {
      if (!visited[i]) {
        List<int> component = [];
        Queue<int> q = Queue();
        q.add(i);
        visited[i] = true;
        component.add(i);

        while (q.isNotEmpty) {
          int u = q.removeFirst();
          for (int v in adj[u]) {
            if (!visited[v]) {
              visited[v] = true;
              component.add(v);
              q.add(v);
            }
          }
        }

        int maxComponentGroups = 0;
        for (int node in component) {
          List<int> level = List.filled(n + 1, -1);
          Queue<int> bfsQ = Queue();
          bfsQ.add(node);
          level[node] = 1;

          while (bfsQ.isNotEmpty) {
            int u = bfsQ.removeFirst();
            for (int v in adj[u]) {
              if (level[v] == -1) {
                level[v] = level[u] + 1;
                bfsQ.add(v);
              }
            }
          }

          int currentMax = 1;
          for (int v in component) {
            if (level[v] > currentMax) {
              currentMax = level[v];
            }
          }
          if (currentMax > maxComponentGroups) {
            maxComponentGroups = currentMax;
          }
        }

        totalGroups += maxComponentGroups;
      }
    }

    return totalGroups;
  }
}

void main() {
  Solution solution = new Solution();

  int n = 6;
  List<List<int>> edges = [
    [1, 2],
    [1, 4],
    [1, 5],
    [2, 6],
    [2, 3],
    [4, 6]
  ];
  print(solution.magnificentSets(n, edges)); // Output: 4

  n = 3;
  edges = [
    [1, 2],
    [2, 3],
    [3, 1]
  ];
  print(solution.magnificentSets(n, edges)); // Output: -1

  n = 92;
  edges = [
    [67, 29],
    [13, 29],
    [77, 29],
    [36, 29],
    [82, 29],
    [54, 29],
    [57, 29],
    [53, 29],
    [68, 29],
    [26, 29],
    [21, 29],
    [46, 29],
    [41, 29],
    [45, 29],
    [56, 29],
    [88, 29],
    [2, 29],
    [7, 29],
    [5, 29],
    [16, 29],
    [37, 29],
    [50, 29],
    [79, 29],
    [91, 29],
    [48, 29],
    [87, 29],
    [25, 29],
    [80, 29],
    [71, 29],
    [9, 29],
    [78, 29],
    [33, 29],
    [4, 29],
    [44, 29],
    [72, 29],
    [65, 29],
    [61, 29]
  ];
  print(solution.magnificentSets(n, edges)); // Output: 57
}
