int maxMatrixSum(List<List<int>> matrix) {
  int totalSum = 0;
  int negativeCount = 0;
  int minAbsValue = 100000;

  for (var row in matrix) {
    for (var value in row) {
      totalSum += value.abs();
      if (value < 0) negativeCount++;
      minAbsValue = minAbsValue < value.abs() ? minAbsValue : value.abs();
    }
  }

  if (negativeCount % 2 != 0) {
    totalSum -= 2 * minAbsValue;
  }

  return totalSum;
}

void main() {
  var matrix1 = [
    [1, -1],
    [-1, 1]
  ];
  print(maxMatrixSum(matrix1)); // Output: 4

  var matrix2 = [
    [1, 2, 3],
    [-1, -2, -3],
    [1, 2, 3]
  ];
  print(maxMatrixSum(matrix2)); // Output: 16
}
