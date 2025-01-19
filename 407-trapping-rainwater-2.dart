import 'dart:io';

class Cell {
  final int row;
  final int col;
  final int height;

  Cell(this.row, this.col, this.height);
}

class MinHeap {
  final List<Cell> _heap = [];

  void add(Cell cell) {
    _heap.add(cell);
    _siftUp(_heap.length - 1);
  }

  Cell removeMin() {
    if (_heap.isEmpty) throw Exception('Heap is empty');

    final Cell min = _heap[0];
    final Cell last = _heap.removeLast();
    if (_heap.isNotEmpty) {
      _heap[0] = last;
      _siftDown(0);
    }
    return min;
  }

  bool get isEmpty => _heap.isEmpty;

  void _siftUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_heap[parentIndex].height <= _heap[index].height) break;
      _swap(index, parentIndex);
      index = parentIndex;
    }
  }

  void _siftDown(int index) {
    while (true) {
      int smallest = index;
      int leftChild = 2 * index + 1;
      int rightChild = 2 * index + 2;

      if (leftChild < _heap.length &&
          _heap[leftChild].height < _heap[smallest].height) {
        smallest = leftChild;
      }
      if (rightChild < _heap.length &&
          _heap[rightChild].height < _heap[smallest].height) {
        smallest = rightChild;
      }

      if (smallest == index) break;
      _swap(index, smallest);
      index = smallest;
    }
  }

  void _swap(int i, int j) {
    final Cell temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

class Solution {
  int trapRainWater(List<List<int>> heightMap) {
    if (heightMap.isEmpty || heightMap[0].isEmpty) return 0;

    final int m = heightMap.length;
    final int n = heightMap[0].length;
    if (m <= 2 || n <= 2) return 0;

    final visited = List.generate(m, (_) => List.filled(n, false));
    final minHeap = MinHeap();

    for (int i = 0; i < m; i++) {
      minHeap.add(Cell(i, 0, heightMap[i][0]));
      minHeap.add(Cell(i, n - 1, heightMap[i][n - 1]));
      visited[i][0] = true;
      visited[i][n - 1] = true;
    }

    for (int j = 1; j < n - 1; j++) {
      minHeap.add(Cell(0, j, heightMap[0][j]));
      minHeap.add(Cell(m - 1, j, heightMap[m - 1][j]));
      visited[0][j] = true;
      visited[m - 1][j] = true;
    }

    final directions = [
      [-1, 0],
      [1, 0],
      [0, -1],
      [0, 1]
    ];
    int waterTrapped = 0;

    while (!minHeap.isEmpty) {
      final Cell current = minHeap.removeMin();

      for (final direction in directions) {
        final int newRow = current.row + direction[0];
        final int newCol = current.col + direction[1];

        if (newRow >= 0 &&
            newRow < m &&
            newCol >= 0 &&
            newCol < n &&
            !visited[newRow][newCol]) {
          visited[newRow][newCol] = true;

          if (heightMap[newRow][newCol] < current.height) {
            waterTrapped += current.height - heightMap[newRow][newCol];
            minHeap.add(Cell(newRow, newCol, current.height));
          } else {
            minHeap.add(Cell(newRow, newCol, heightMap[newRow][newCol]));
          }
        }
      }
    }

    return waterTrapped;
  }
}

void generatePattern(int rows, {String symbol = '*'}) {
  if (rows <= 0) {
    print('Please provide a positive number of rows');
    return;
  }

  // Generate pyramid pattern
  for (int i = 0; i < rows; i++) {
    // Print spaces
    for (int j = 0; j < rows - i - 1; j++) {
      stdout.write(' ');
    }

    // Print symbols
    for (int k = 0; k <= i * 2; k++) {
      stdout.write(symbol);
    }
    print(''); // New line
  }
}

void transformArray(List<int> numbers, {bool sortAscending = true}) {
  if (numbers.isEmpty) {
    print('Array is empty');
    return;
  }

  print('Original array: $numbers');

  numbers.sort((a, b) => sortAscending ? a.compareTo(b) : b.compareTo(a));
  print('Sorted array: $numbers');

  double average = numbers.reduce((a, b) => a + b) / numbers.length;
  int max = numbers.reduce((a, b) => a > b ? a : b);
  int min = numbers.reduce((a, b) => a < b ? a : b);

  print('Statistics:');
  print('Average: ${average.toStringAsFixed(2)}');
  print('Maximum: $max');
  print('Minimum: $min');
}

void main() {
  // Example 1: Using generatePattern
  print('Example 1 - Pattern with 4 rows using "*":');
  generatePattern(4);

  print('\nExample 1 - Pattern with 3 rows using "#":');
  generatePattern(3, symbol: '#');

  // Example 2: Using transformArray
  print('\nExample 2');
  List<int> numbers1 = [64, 34, 25, 12, 22, 11, 90];
  transformArray(numbers1);

  print('\nExample 2');
  List<int> numbers2 = [5, 2, 8, 1, 9];
  transformArray(numbers2, sortAscending: false);
}
