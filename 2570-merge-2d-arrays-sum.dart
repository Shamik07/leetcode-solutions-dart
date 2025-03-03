class Solution {
  List<List<int>> mergeArrays(List<List<int>> nums1, List<List<int>> nums2) {
    Map<int, int> idSumMap = {};

    for (var pair in nums1) {
      int id = pair[0];
      int val = pair[1];
      idSumMap[id] = (idSumMap[id] ?? 0) + val;
    }

    for (var pair in nums2) {
      int id = pair[0];
      int val = pair[1];
      idSumMap[id] = (idSumMap[id] ?? 0) + val;
    }

    List<List<int>> result = [];
    idSumMap.forEach((id, sum) {
      result.add([id, sum]);
    });

    result.sort((a, b) => a[0].compareTo(b[0]));

    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.mergeArrays([
    [1, 2],
    [2, 3],
    [4, 5]
  ], [
    [1, 4],
    [3, 2],
    [4, 1]
  ])); // [[1, 6], [2, 3], [3, 2], [4, 6]]

  // Test Case 2
  print(solution.mergeArrays([
    [1, 1],
    [2, 2]
  ], [
    [2, 2],
    [3, 3]
  ])); // [[1, 1], [2, 4], [3, 3]]

  // Test Case 3
  print(solution.mergeArrays([
    [5, 10]
  ], [
    [5, 10],
    [6, 6]
  ])); // [[5, 20], [6, 6]]
}
