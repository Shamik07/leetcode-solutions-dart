import 'dart:math';

class Solution {
  int minimumTime(List<List<int>> grid) {
    if (grid[0][1] > 1 && grid[1][0] > 1) {
      return -1;
    }

    final directions = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0],
    ];
    final m = grid.length;
    final n = grid[0].length;

    final minHeap = <List<int>>[];
    final seen = <String>{};

    _pushHeap(minHeap, [0, 0, 0]);
    seen.add('0,0');

    while (minHeap.isNotEmpty) {
      final current = _popHeap(minHeap);
      final time = current[0];
      final i = current[1];
      final j = current[2];

      if (i == m - 1 && j == n - 1) {
        return time;
      }

      for (final dir in directions) {
        final x = i + dir[0];
        final y = j + dir[1];

        if (x < 0 || x >= m || y < 0 || y >= n) {
          continue;
        }

        final key = '$x,$y';
        if (seen.contains(key)) {
          continue;
        }

        final extraWait = (grid[x][y] - time) % 2 == 0 ? 1 : 0;
        final nextTime = max(time + 1, grid[x][y] + extraWait);
        _pushHeap(minHeap, [nextTime, x, y]);
        seen.add(key);
      }
    }

    return -1;
  }

  void _pushHeap(List<List<int>> heap, List<int> element) {
    heap.add(element);
    int index = heap.length - 1;
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[parentIndex][0] <= heap[index][0]) {
        break;
      }
      // Swap parent
      final temp = heap[parentIndex];
      heap[parentIndex] = heap[index];
      heap[index] = temp;
      index = parentIndex;
    }
  }

  List<int> _popHeap(List<List<int>> heap) {
    if (heap.isEmpty) return [];
    final minElement = heap[0];
    final lastElement = heap.removeLast();
    if (heap.isEmpty) return minElement;

    heap[0] = lastElement;
    int index = 0;
    while (true) {
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;
      int smallest = index;

      if (leftChild < heap.length && heap[leftChild][0] < heap[smallest][0]) {
        smallest = leftChild;
      }
      if (rightChild < heap.length && heap[rightChild][0] < heap[smallest][0]) {
        smallest = rightChild;
      }
      if (smallest == index) {
        break;
      }

      // Swap smallest
      final temp = heap[index];
      heap[index] = heap[smallest];
      heap[smallest] = temp;
      index = smallest;
    }

    return minElement;
  }
}

void main() {
  Solution solution = new Solution();

  List<List<int>> grid1 = [
    [0, 1, 3, 2],
    [5, 1, 2, 5],
    [4, 3, 8, 6]
  ];
  print(solution.minimumTime(grid1)); // Output: 7

  List<List<int>> grid2 = [
    [0, 2, 4],
    [3, 2, 1],
    [1, 0, 4]
  ];
  print(solution.minimumTime(grid2)); // Output: -1

  List<List<int>> largeGrid = [
    [0, 0, 45748, 26980, 16204],
    [50804, 70925, 73472, 85571, 72683],
    [20581, 75893, 228, 5455, 11856],
    [37878, 15289, 13892, 20762, 8144],
    [98036, 68520, 33682, 11384, 77793]
  ];
  print(solution.minimumTime(largeGrid)); // larger grids
}
