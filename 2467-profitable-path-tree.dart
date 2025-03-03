import 'dart:collection';

class Solution {
  int mostProfitablePath(List<List<int>> edges, int bob, List<int> amount) {
    Map<int, List<int>> graph = {};
    for (var edge in edges) {
      int u = edge[0], v = edge[1];
      graph.putIfAbsent(u, () => []).add(v);
      graph.putIfAbsent(v, () => []).add(u);
    }

    Map<int, int> parent = {};
    Queue<int> q = Queue();
    q.add(0);
    parent[0] = -1;

    while (q.isNotEmpty) {
      int u = q.removeFirst();
      for (int v in graph[u]!) {
        if (!parent.containsKey(v) && v != parent[u]) {
          parent[v] = u;
          q.add(v);
        }
      }
    }

    List<int> bobPath = [];
    int current = bob;
    while (current != -1) {
      bobPath.add(current);
      current = parent[current]!;
    }

    Map<int, int> bobTime = {};
    for (int i = 0; i < bobPath.length; i++) {
      bobTime[bobPath[i]] = i;
    }

    int maxIncome = -0x3f3f3f3f; // Initialize small

    List<List<int>> stack = [];
    stack.add([0, -1, 0, 0]);

    while (stack.isNotEmpty) {
      var current = stack.removeLast();
      int node = current[0];
      int parentNode = current[1];
      int time = current[2];
      int income = current[3];

      if (bobTime.containsKey(node)) {
        int bobT = bobTime[node]!;
        if (time < bobT) {
          income += amount[node];
        } else if (time == bobT) {
          income += amount[node] ~/ 2;
        }
        // Bob arrived earlier
      } else {
        income += amount[node];
      }

      bool isLeaf =
          (graph[node]!.length == 1 && node != 0) || (graph[node]!.isEmpty);
      if (isLeaf) {
        if (income > maxIncome) {
          maxIncome = income;
        }
        continue;
      }

      for (int neighbor in graph[node]!) {
        if (neighbor != parentNode) {
          stack.add([neighbor, node, time + 1, income]);
        }
      }
    }

    return maxIncome;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.mostProfitablePath(
      [
        [0, 1],
        [1, 2],
        [1, 3],
        [3, 4]
      ],
      3,
      [-2, 4, 2, -4, 6])); // 6

  // Test Case 2
  print(solution.mostProfitablePath(
      [
        [0, 1]
      ],
      1,
      [-7280, 2350])); // -7280

  // Test Case 3
  print(solution.mostProfitablePath(
      [
        [0, 1],
        [1, 2],
        [2, 3]
      ],
      2,
      [1, 2, 3, 4])); // 7
}
