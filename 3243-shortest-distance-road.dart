import 'dart:collection';

class Solution {
  List<int> shortestDistanceAfterQueries(int n, List<List<int>> queries) {
    List<int> ans = List.filled(queries.length, 0);
    List<int> dist = List.generate(n, (i) => i);
    List<List<int>> graph = List.generate(n, (_) => []);

    for (int i = 0; i < n - 1; ++i) {
      graph[i].add(i + 1);
    }

    for (int i = 0; i < queries.length; ++i) {
      final int u = queries[i][0];
      final int v = queries[i][1];
      graph[u].add(v);
      if (dist[u] + 1 < dist[v]) {
        dist[v] = dist[u] + 1;
        bfs(graph, v, dist);
      }
      ans[i] = dist[n - 1];
    }

    return ans;
  }

  // update distances
  void bfs(List<List<int>> graph, int start, List<int> dist) {
    Queue<int> q = Queue();
    q.add(start);

    while (q.isNotEmpty) {
      final int u = q.removeFirst();
      for (final int v in graph[u]) {
        if (dist[u] + 1 < dist[v]) {
          dist[v] = dist[u] + 1;
          q.add(v);
        }
      }
    }
  }
}

void main() {
  Solution solution = Solution();

  int n1 = 5;
  List<List<int>> queries1 = [
    [2, 4],
    [0, 2],
    [0, 4]
  ];
  print(solution.shortestDistanceAfterQueries(n1, queries1)); // Output: [3, 2, 1]

  int n2 = 4;
  List<List<int>> queries2 = [
    [0, 3],
    [0, 2]
  ];
  print(solution.shortestDistanceAfterQueries(n2, queries2)); // Output: [1, 1]
}
