import 'dart:collection';

class Solution {
  int maximumInvitations(List<int> favorite) {
    int n = favorite.length;
    List<int> indegree = List.filled(n, 0);
    List<int> depth = List.filled(n, 0);
    List<bool> visited = List.filled(n, false);

    for (int f in favorite) {
      indegree[f]++;
    }

    Queue<int> queue = Queue();
    for (int i = 0; i < n; i++) {
      if (indegree[i] == 0) {
        queue.add(i);
      }
    }

    while (queue.isNotEmpty) {
      int node = queue.removeFirst();
      visited[node] = true;
      int next = favorite[node];
      depth[next] = max(depth[next], depth[node] + 1);
      indegree[next]--;
      if (indegree[next] == 0) {
        queue.add(next);
      }
    }

    int maxCycleSize = 0;
    int pairSum = 0;

    for (int i = 0; i < n; i++) {
      if (!visited[i]) {
        int current = i;
        int cycleSize = 0;

        while (!visited[current]) {
          visited[current] = true;
          current = favorite[current];
          cycleSize++;
        }

        if (cycleSize == 2) {
          int a = current;
          int b = favorite[current];
          pairSum += 2 + depth[a] + depth[b];
        } else {
          maxCycleSize = max(maxCycleSize, cycleSize);
        }
      }
    }

    return max(maxCycleSize, pairSum);
  }

  int max(int a, int b) => (a > b) ? a : b;
}

void main() {
  final solution = Solution();

  // Test cases
  print(solution.maximumInvitations([2, 2, 1, 2])); // 3
  print(solution.maximumInvitations([1, 2, 0])); // 3
  print(solution.maximumInvitations([3, 0, 1, 4, 1])); // 4
  print(
      solution.maximumInvitations([1, 2, 3, 4, 5, 6, 3, 8, 9, 10, 11, 8])); // 4

  final largeInput = List.generate(100000, (i) => (i + 5) % 100000);
  print(solution.maximumInvitations(largeInput));
}
