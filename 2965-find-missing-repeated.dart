class Solution {
  List<int> findMissingAndRepeatedValues(List<List<int>> grid) {
    int n = grid.length;
    int totalNumbers = n * n;
    List<int> flattened = [];

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        flattened.add(grid[i][j]);
      }
    }

    Map<int, int> frequency = {};
    for (int num in flattened) {
      frequency[num] = (frequency[num] ?? 0) + 1;
    }

    int repeating = 0;
    int missing = 0;

    for (int i = 1; i <= totalNumbers; i++) {
      if (frequency.containsKey(i)) {
        if (frequency[i] == 2) {
          repeating = i;
        }
      } else {
        missing = i;
      }
    }

    return [repeating, missing];
  }
}

void main() {
  Solution solution = Solution();

  List<List<int>> grid1 = [
    [1, 3],
    [2, 2]
  ];
  print(solution.findMissingAndRepeatedValues(grid1)); // Output: [2, 4]

  List<List<int>> grid2 = [
    [9, 1, 7],
    [8, 9, 2],
    [3, 4, 6]
  ];
  print(solution.findMissingAndRepeatedValues(grid2)); // Output: [9, 5]
}
