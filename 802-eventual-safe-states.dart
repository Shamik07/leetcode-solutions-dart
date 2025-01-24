class Solution {
  List<int> eventualSafeNodes(List<List<int>> graph) {
    final int n = graph.length;
    List<int> state = List.filled(n, 0);
    List<int> safeNodes = [];

    for (int i = 0; i < n; i++) {
      if (isSafe(i, graph, state)) {
        safeNodes.add(i);
      }
    }

    safeNodes.sort();
    return safeNodes;
  }

  bool isSafe(int node, List<List<int>> graph, List<int> state) {
    if (state[node] == 2) return true;
    if (state[node] == 1) return false;

    state[node] = 1;

    for (int next in graph[node]) {
      if (!isSafe(next, graph, state)) {
        return false;
      }
    }

    state[node] = 2;
    return true;
  }
}

void main() {
  final solution = Solution();

  final List<List<int>> graph1 = [
    <int>[1, 2],
    <int>[2, 3],
    <int>[5],
    <int>[0],
    <int>[5],
    <int>[],
    <int>[]
  ];
  print('Test case 1: ${solution.eventualSafeNodes(graph1)}');

  final List<List<int>> graph2 = [
    <int>[1, 2, 3, 4],
    <int>[1, 2],
    <int>[3, 4],
    <int>[0, 4],
    <int>[]
  ];
  print('Test case 2: ${solution.eventualSafeNodes(graph2)}');

  final List<List<int>> graph3 = [
    <int>[1],
    <int>[2],
    <int>[2],
    <int>[]
  ];
  print('Test case 3: ${solution.eventualSafeNodes(graph3)}');
}
