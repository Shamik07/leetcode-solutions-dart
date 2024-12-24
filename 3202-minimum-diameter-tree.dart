import 'dart:collection';

class Solution {
  int minimumDiameterAfterMerge(
      List<List<int>> edges1, List<List<int>> edges2) {
    final int diameter1 = getDiameter(edges1);
    final int diameter2 = getDiameter(edges2);
    final int combinedDiameter =
        (diameter1 + 1) ~/ 2 + (diameter2 + 1) ~/ 2 + 1;
    return [diameter1, diameter2, combinedDiameter]
        .reduce((a, b) => a > b ? a : b);
  }

  int getDiameter(List<List<int>> edges) {
    final int n = edges.length + 1;
    final List<List<int>> graph = List.generate(n, (_) => []);

    for (final edge in edges) {
      final int u = edge[0];
      final int v = edge[1];
      graph[u].add(v);
      graph[v].add(u);
    }

    final int farthestNode = bfsGetFarthestNode(graph, 0).key;
    return bfsGetFarthestNode(graph, farthestNode).value;
  }

  MapEntry<int, int> bfsGetFarthestNode(List<List<int>> graph, int start) {
    final Queue<int> queue = Queue();
    final List<int> distance = List.filled(graph.length, -1);
    queue.add(start);
    distance[start] = 0;

    int farthestNode = start;
    int maxDistance = 0;

    while (queue.isNotEmpty) {
      final int u = queue.removeFirst();

      for (final int v in graph[u]) {
        if (distance[v] == -1) {
          distance[v] = distance[u] + 1;
          queue.add(v);

          if (distance[v] > maxDistance) {
            maxDistance = distance[v];
            farthestNode = v;
          }
        }
      }
    }

    return MapEntry(farthestNode, maxDistance);
  }
}

void main() {
  Solution solution = Solution();

  List<List<int>> edges1 = [
    [3, 0],
    [2, 1],
    [2, 3]
  ];
  List<List<int>> edges2 = [
    [0, 1],
    [0, 4],
    [3, 5],
    [6, 3],
    [7, 6],
    [2, 7],
    [0, 2],
    [8, 0],
    [8, 9]
  ];
  print(solution.minimumDiameterAfterMerge(edges1, edges2)); // Expected: 7

  edges1 = [
    [0, 1],
    [0, 2],
    [0, 3]
  ];
  edges2 = [
    [0, 1]
  ];
  print(solution.minimumDiameterAfterMerge(edges1, edges2)); // Expected: 3

  edges1 = [
    [0, 1],
    [0, 2],
    [0, 3],
    [2, 4],
    [2, 5],
    [3, 6],
    [2, 7]
  ];
  edges2 = [
    [0, 1],
    [0, 2],
    [0, 3],
    [2, 4],
    [2, 5],
    [3, 6],
    [2, 7]
  ];
  print(solution.minimumDiameterAfterMerge(edges1, edges2)); // Expected: 5

  edges1 = [];
  edges2 = [
    [0, 1],
    [1, 2]
  ];
  print(solution.minimumDiameterAfterMerge(edges1, edges2)); // Expected: 2

  edges1 = [];
  edges2 = [];
  print(solution.minimumDiameterAfterMerge(edges1, edges2)); // Expected: 1

  edges1 = [
    [0, 1]
  ];
  edges2 = [];
  print(solution.minimumDiameterAfterMerge(edges1, edges2)); // Expected: 2
}
