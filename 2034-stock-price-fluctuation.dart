import 'package:collection/collection.dart';

class StockPrice {
  final Map<int, int> records = {};

  int latestTimestamp = 0;

  final PriorityQueue<List<int>> minHeap =
      PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
  final PriorityQueue<List<int>> maxHeap =
      PriorityQueue<List<int>>((a, b) => b[0].compareTo(a[0]));

  StockPrice();

  void update(int timestamp, int price) {
    records[timestamp] = price;
    latestTimestamp = timestamp > latestTimestamp ? timestamp : latestTimestamp;
    minHeap.add([price, timestamp]);
    maxHeap.add([price, timestamp]);
  }

  int current() {
    return records[latestTimestamp]!;
  }

  int maximum() {
    while (
        maxHeap.isNotEmpty && records[maxHeap.first[1]] != maxHeap.first[0]) {
      maxHeap.removeFirst();
    }
    return maxHeap.first[0];
  }

  int minimum() {
    while (
        minHeap.isNotEmpty && records[minHeap.first[1]] != minHeap.first[0]) {
      minHeap.removeFirst();
    }
    return minHeap.first[0];
  }
}

void main() {
  // Example 1 from the problem
  StockPrice stockPrice = StockPrice();

  stockPrice.update(1, 10);
  stockPrice.update(2, 5);
  print("Current: ${stockPrice.current()}"); // 5
  print("Maximum: ${stockPrice.maximum()}"); // 10

  stockPrice.update(1, 3);
  print("Maximum after correction: ${stockPrice.maximum()}"); // 5

  stockPrice.update(4, 2);
  print("Minimum: ${stockPrice.minimum()}"); // 2
}
