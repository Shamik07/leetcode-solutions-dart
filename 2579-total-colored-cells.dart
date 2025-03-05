class Solution {
  int coloredCells(int n) {
    if (n == 1) {
      return 1;
    }
    return 2 * n * n - 2 * n + 1;
  }
}

void main() {
  Solution solution = Solution();

  int n1 = 1;
  print(solution.coloredCells(n1)); // Output: 1

  int n2 = 2;
  print(solution.coloredCells(n2)); // Output: 5

  int n3 = 3;
  print(solution.coloredCells(n3)); // Output: 13
}
