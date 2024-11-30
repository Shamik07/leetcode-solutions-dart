List<List<int>> validArrangement(List<List<int>> pairs) {
  
  Map<int, List<int>> graph = {};
  Map<int, int> outDegree = {};
  Map<int, int> inDegree = {};

  for (var pair in pairs) {
    int start = pair[0];
    int end = pair[1];
    
    graph.putIfAbsent(start, () => []);
    graph[start]!.add(end);
    
    outDegree[start] = (outDegree[start] ?? 0) + 1;
    inDegree[end] = (inDegree[end] ?? 0) + 1;
  }

  // start node for Eulerian path
  int startNode = pairs[0][0];
  for (var node in outDegree.keys) {
    if ((outDegree[node] ?? 0) > (inDegree[node] ?? 0)) {
      startNode = node;
      break;
    }
  }

  // DFS to find eulerian path
  List<List<int>> result = [];
  List<int> stack = [startNode];

  while (stack.isNotEmpty) {
    int node = stack.last;
    if (graph[node]?.isNotEmpty ?? false) {
      int nextNode = graph[node]!.removeLast();
      stack.add(nextNode);
    } else {
      stack.removeLast();
      if (stack.isNotEmpty) {
        result.add([stack.last, node]);
      }
    }
  }

  // Reverse
  result = result.reversed.toList();
  return result;
}

void main() {
  List<List<int>> pairs1 = [
    [5, 1],
    [4, 5],
    [11, 9],
    [9, 4]
  ];
  print(validArrangement(pairs1)); // Output: [[11,9],[9,4],[4,5],[5,1]]

  List<List<int>> pairs2 = [
    [1, 3],
    [3, 2],
    [2, 1]
  ];
  print(validArrangement(pairs2)); // Output: [[1,3],[3,2],[2,1]]

  List<List<int>> pairs3 = [
    [1, 2],
    [1, 3],
    [2, 1]
  ];
  print(validArrangement(pairs3)); // Output: [[1,2],[2,1],[1,3]]
}

