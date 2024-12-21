class Solution {
  int ans = 0;

  int maxKDivisibleComponents(int n, List<List<int>> edges, List<int> values, int k) {
    ans = 0;

    List<List<int>> graph = List.generate(n, (_) => []);
    
    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];
      graph[u].add(v);
      graph[v].add(u);
    }

    List<int> subtreeSum = List.filled(n, 0); 
    List<bool> visited = List.filled(n, false);
    List<int> stack = [];
    List<int> parent = List.filled(n, -1);

    stack.add(0);
    while (stack.isNotEmpty) {
      int node = stack.last;

      if (!visited[node]) {
        visited[node] = true;
        for (int neighbor in graph[node]) {
          if (!visited[neighbor]) {
            stack.add(neighbor);
            parent[neighbor] = node;
          }
        }
      } else {
        stack.removeLast();
        subtreeSum[node] = values[node];

        for (int neighbor in graph[node]) {
          if (neighbor != parent[node]) {
            subtreeSum[node] += subtreeSum[neighbor];
          }
        }

        if (subtreeSum[node] % k == 0) {
          ans++;
          subtreeSum[node] = 0;
        }
      }
    }

    return ans;
  }
}

void main() {
  Solution solution = new Solution();

  int n = 5;
  List<List<int>> edges = [
    [0, 2],
    [1, 2],
    [1, 3],
    [2, 4]
  ];
  List<int> values = [1, 8, 1, 4, 4];
  int k = 6;
  print(solution.maxKDivisibleComponents(n, edges, values, k)); // Output: 2

  int n2 = 7;
  List<List<int>> edges2 = [
    [0, 1],
    [0, 2],
    [1, 3],
    [1, 4],
    [2, 5],
    [2, 6]
  ];
  List<int> values2 = [3, 0, 6, 1, 5, 2, 1];
  int k2 = 3;
  print(solution.maxKDivisibleComponents(n2, edges2, values2, k2)); // Output: 3
}
