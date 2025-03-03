import 'dart:collection';

class NumberContainers {
  final Map<int, int> _indexToNumber = {};

  final Map<int, SplayTreeSet<int>> _numberToIndices = {};

  NumberContainers() {}

  void change(int index, int number) {
    if (_indexToNumber.containsKey(index)) {
      int oldNumber = _indexToNumber[index]!;
      _numberToIndices[oldNumber]?.remove(index);
      if (_numberToIndices[oldNumber]?.isEmpty ?? false) {
        _numberToIndices.remove(oldNumber);
      }
    }

    _indexToNumber[index] = number;

    _numberToIndices.putIfAbsent(number, () => SplayTreeSet()).add(index);
  }

  int find(int number) {
    SplayTreeSet<int>? indices = _numberToIndices[number];

    if (indices == null || indices.isEmpty) {
      return -1;
    }

    return indices.first;
  }
}

/**
 * Your NumberContainers object will be instantiated and called as such:
 * NumberContainers obj = NumberContainers();
 * obj.change(index,number);
 * int param2 = obj.find(number);
 */

void main() {
  // Test Case 1
  final nc1 = NumberContainers();
  nc1.change(1, 10);
  nc1.change(2, 10);
  nc1.change(1, 20);
  print(nc1.find(10)); // 2
  print(nc1.find(20)); // 1

  // Test Case 2
  final nc2 = NumberContainers();
  nc2.change(3, 30);
  nc2.change(3, 10);
  print(nc2.find(30)); // -1
  print(nc2.find(10)); // 3

  // Test Case 3
  final nc3 = NumberContainers();
  nc3.change(5, 50);
  nc3.change(5, 60);
  nc3.change(6, 50);
  print(nc3.find(50)); // 6
  print(nc3.find(60)); // 5
}
