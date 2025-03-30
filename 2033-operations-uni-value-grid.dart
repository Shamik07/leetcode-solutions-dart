int minOperations(List<List<int>> grid, int x) {
  List<int> values = [];
  for (var row in grid) {
    values.addAll(row);
  }

  int remainder = values[0] % x;
  for (int value in values) {
    if (value % x != remainder) {
      return -1;
    }
  }

  values.sort();
  int median = values[values.length ~/ 2];

  int operations = 0;
  for (int value in values) {
    operations += ((value - median).abs() ~/ x);
  }

  return operations;
}

void main() {
  // Example 1
  List<List<int>> grid1 = [
    [2, 4],
    [6, 8]
  ];
  int x1 = 2;
  print("Example 1: ${minOperations(grid1, x1)}"); // Output: 4

  // Example 2
  List<List<int>> grid2 = [
    [1, 5],
    [2, 3]
  ];
  int x2 = 1;
  print("Example 2: ${minOperations(grid2, x2)}"); // Output: 5

  // Example 3
  List<List<int>> grid3 = [
    [1, 2],
    [3, 4]
  ];
  int x3 = 2;
  print("Example 3: ${minOperations(grid3, x3)}"); // Output: -1
}
