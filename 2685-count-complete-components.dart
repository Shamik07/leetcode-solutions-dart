int countCompleteComponents(int n, List<List<int>> edges) {
  List<Set<int>> graph = List.generate(n, (_) => <int>{});
  for (var edge in edges) {
    graph[edge[0]].add(edge[1]);
    graph[edge[1]].add(edge[0]);
  }

  List<bool> visited = List.filled(n, false);
  int completeCount = 0;

  for (int i = 0; i < n; i++) {
    if (!visited[i]) {
      List<int> component = [];
      dfs(i, graph, visited, component);

      int size = component.length;
      bool complete = true;

      if (size == 1) {
        completeCount++;
        continue;
      }

      int edgeCount = 0;
      Set<int> componentSet = component.toSet();

      for (int node in component) {
        if (graph[node].length < size - 1) {
          complete = false;
          break;
        }

        for (int neighbor in graph[node]) {
          if (componentSet.contains(neighbor) && node < neighbor) {
            edgeCount++;
          }
        }
      }

      if (complete && edgeCount == size * (size - 1) ~/ 2) {
        completeCount++;
      }
    }
  }

  return completeCount;
}

void dfs(
    int node, List<Set<int>> graph, List<bool> visited, List<int> component) {
  visited[node] = true;
  component.add(node);

  for (int neighbor in graph[node]) {
    if (!visited[neighbor]) {
      dfs(neighbor, graph, visited, component);
    }
  }
}

void main() {
  // Example 1
  int n1 = 6;
  List<List<int>> edges1 = [
    [0, 1],
    [0, 2],
    [1, 2],
    [3, 4]
  ];
  print(
      "Example 1 Result: ${countCompleteComponents(n1, edges1)}"); // Expected: 3

  // Example 2
  int n2 = 6;
  List<List<int>> edges2 = [
    [0, 1],
    [0, 2],
    [1, 2],
    [3, 4],
    [3, 5]
  ];
  print(
      "Example 2 Result: ${countCompleteComponents(n2, edges2)}"); // Expected: 1

  // Example 3
  int n3 = 8;
  List<List<int>> edges3 = [
    [0, 1],
    [0, 2],
    [1, 2],
    [3, 4],
    [3, 5],
    [4, 5],
    [6, 7]
  ];
  print(
      "Example 3 Result: ${countCompleteComponents(n3, edges3)}"); // Expected: 3
}
