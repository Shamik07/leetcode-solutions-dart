class Solution {
  List<int> queryResults(int limit, List<List<int>> queries) {
    Map<int, int> ballColors = {};
    Map<int, int> colorCounts = {};
    List<int> result = List<int>.filled(queries.length, 0);

    for (int i = 0; i < queries.length; i++) {
      int ball = queries[i][0];
      int newColor = queries[i][1];

      if (ballColors.containsKey(ball)) {
        int oldColor = ballColors[ball]!;
        colorCounts[oldColor] = colorCounts[oldColor]! - 1;

        // remove
        if (colorCounts[oldColor] == 0) {
          colorCounts.remove(oldColor);
        }
      }

      // Update
      ballColors[ball] = newColor;
      colorCounts[newColor] = (colorCounts[newColor] ?? 0) + 1;

      // Add
      result[i] = colorCounts.length;
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  final limit1 = 4;
  final queries1 = [
    [1, 1],
    [2, 2],
    [3, 1],
    [1, 3]
  ];
  print(
      'Test Case 1: ${solution.queryResults(limit1, queries1)}'); // Expected: [1, 2, 2, 3]

  // Test Case 2
  final limit2 = 5;
  final queries2 = [
    [1, 2],
    [2, 2],
    [3, 2],
    [4, 2],
    [5, 2]
  ];
  print(
      'Test Case 2: ${solution.queryResults(limit2, queries2)}'); // Expected: [1, 1, 1, 1, 1]
}
