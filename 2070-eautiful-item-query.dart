class Solution {
  List<int> maximumBeauty(List<List<int>> items, List<int> queries) {
    List<int> ans = [];
    List<int> prices = [];
    List<int> maxBeautySoFar = List.filled(items.length + 1, 0);

    items.sort((a, b) => a[0].compareTo(b[0]));

    for (List<int> item in items) {
      prices.add(item[0]);
    }

    for (int i = 0; i < items.length; ++i) {
      maxBeautySoFar[i + 1] = max(maxBeautySoFar[i], items[i][1]);
    }

    for (int query in queries) {
      int i = _upperBound(prices, query);
      ans.add(maxBeautySoFar[i]);
    }

    return ans;
  }

  // find the upper bound
  int _upperBound(List<int> prices, int target) {
    int low = 0;
    int high = prices.length;

    while (low < high) {
      int mid = (low + high) ~/ 2;
      if (prices[mid] <= target) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    return low;
  }

  int max(int a, int b) => a > b ? a : b;
}

void main() {
  Solution solution = Solution();

  // Example 1
  List<List<int>> items1 = [
    [1, 2],
    [3, 2],
    [2, 4],
    [5, 6],
    [3, 5]
  ];
  List<int> queries1 = [1, 2, 3, 4, 5, 6];
  List<int> expected1 = [2, 4, 5, 5, 6, 6];
  List<int> result1 = solution.maximumBeauty(items1, queries1);
  print(
      'Example 1: ${result1.toString() == expected1.toString() ? "Passed" : "Failed"}');
  print('Output: $result1, Expected: $expected1\n');

  // Example 2
  List<List<int>> items2 = [
    [1, 2],
    [1, 2],
    [1, 3],
    [1, 4]
  ];
  List<int> queries2 = [1];
  List<int> expected2 = [4];
  List<int> result2 = solution.maximumBeauty(items2, queries2);
  print(
      'Example 2: ${result2.toString() == expected2.toString() ? "Passed" : "Failed"}');
  print('Output: $result2, Expected: $expected2\n');

  // Example 3
  List<List<int>> items3 = [
    [10, 1000]
  ];
  List<int> queries3 = [5];
  List<int> expected3 = [0];
  List<int> result3 = solution.maximumBeauty(items3, queries3);
  print(
      'Example 3: ${result3.toString() == expected3.toString() ? "Passed" : "Failed"}');
  print('Output: $result3, Expected: $expected3\n');
}
