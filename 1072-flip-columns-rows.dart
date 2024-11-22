int maxEqualRowsAfterFlips(List<List<int>> matrix) {
  Map<String, int> patternCount = {};

  for (var row in matrix) {
    List<int> normalPattern = [];
    List<int> flippedPattern = [];

    for (var value in row) {
      //normal and flipped patterns
      normalPattern.add(value);
      flippedPattern.add(value ^ 1);
    }

    // to strings
    String normalKey = normalPattern.join(',');
    String flippedKey = flippedPattern.join(',');

    patternCount[normalKey] = (patternCount[normalKey] ?? 0) + 1;
    patternCount[flippedKey] = (patternCount[flippedKey] ?? 0) + 1;
  }

  int maxRows = 0;
  for (var count in patternCount.values) {
    if (count > maxRows) {
      maxRows = count;
    }
  }

  return maxRows;
}

void main() {
  List<List<int>> matrix1 = [
    [0, 1],
    [1, 1]
  ];
  print(maxEqualRowsAfterFlips(matrix1)); // Output: 1

  List<List<int>> matrix2 = [
    [0, 1],
    [1, 0]
  ];
  print(maxEqualRowsAfterFlips(matrix2)); // Output: 2

  List<List<int>> matrix3 = [
    [0, 0, 0],
    [0, 0, 1],
    [1, 1, 0]
  ];
  print(maxEqualRowsAfterFlips(matrix3)); // Output: 2
}
