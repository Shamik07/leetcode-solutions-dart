class MinHeap {
  List<List<int>> _heap = [];

  void add(List<int> element) {
    _heap.add(element);
    _siftUp(_heap.length - 1);
  }

  List<int> removeMin() {
    if (_heap.isEmpty) throw Exception("Heap is empty");

    final min = _heap[0];
    final last = _heap.removeLast();

    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _siftDown(0);
    }

    return min;
  }

  bool get isEmpty => _heap.isEmpty;

  void _siftUp(int index) {
    final child = _heap[index];
    while (index > 0) {
      int parentIdx = (index - 1) ~/ 2;
      if (_heap[parentIdx][0] <= child[0]) break;
      _heap[index] = _heap[parentIdx];
      index = parentIdx;
    }
    _heap[index] = child;
  }

  void _siftDown(int index) {
    final int length = _heap.length;
    final int half = length ~/ 2;
    final element = _heap[index];

    while (index < half) {
      int childIdx = 2 * index + 1;
      int child = _heap[childIdx][0];

      int rightIdx = childIdx + 1;
      if (rightIdx < length && _heap[rightIdx][0] < child) {
        childIdx = rightIdx;
        child = _heap[childIdx][0];
      }

      if (element[0] <= child) break;

      _heap[index] = _heap[childIdx];
      index = childIdx;
    }

    _heap[index] = element;
  }
}

int countPaths(int n, List<List<int>> roads) {
  const int MOD = 1000000007;

  List<List<List<int>>> graph = List.generate(n, (_) => []);
  for (var road in roads) {
    int u = road[0];
    int v = road[1];
    int time = road[2];
    graph[u].add([v, time]);
    graph[v].add([u, time]); // bidirectional
  }

  List<int> dist = List.filled(n, 9007199123740992);
  List<int> ways = List.filled(n, 0);

  dist[0] = 0;
  ways[0] = 1;

  final pq = MinHeap();
  pq.add([0, 0]);

  while (!pq.isEmpty) {
    final current = pq.removeMin();
    int d = current[0];
    int node = current[1];

    if (d > dist[node]) continue;

    // neighbors
    for (var edge in graph[node]) {
      int v = edge[0];
      int time = edge[1];

      int newDist = d + time;

      // shorter path
      if (newDist < dist[v]) {
        dist[v] = newDist;
        ways[v] = ways[node];
        pq.add([newDist, v]);
      } else if (newDist == dist[v]) {
        ways[v] = (ways[v] + ways[node]) % MOD;
      }
    }
  }

  return ways[n - 1];
}

void main() {
  // Example 1
  int n1 = 7;
  List<List<int>> roads1 = [
    [0, 6, 7],
    [0, 1, 2],
    [1, 2, 3],
    [1, 3, 3],
    [6, 3, 3],
    [3, 5, 1],
    [6, 5, 1],
    [2, 5, 1],
    [0, 4, 5],
    [4, 6, 2]
  ];
  print("Example 1: ${countPaths(n1, roads1)}"); // Expected: 4

  // Example 2
  int n2 = 2;
  List<List<int>> roads2 = [
    [1, 0, 10]
  ];
  print("Example 2: ${countPaths(n2, roads2)}"); // Expected: 1

  // Example 3 (custom)
  int n3 = 5;
  List<List<int>> roads3 = [
    [0, 1, 1],
    [0, 2, 2],
    [1, 2, 1],
    [1, 3, 2],
    [2, 3, 1],
    [2, 4, 4],
    [3, 4, 3]
  ];
  print("Example 3: ${countPaths(n3, roads3)}"); // Expected: 3
}
