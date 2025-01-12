class Solution {
  int findComplement(int num) {
    if (num == 0) return 1;

    int mask = num;
    mask |= mask >> 1;
    mask |= mask >> 2;
    mask |= mask >> 4;
    mask |= mask >> 8;
    mask |= mask >> 16;

    return num ^ mask;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  final num1 = 5;
  print('Example 1: ${solution.findComplement(num1)}'); // Output: 2

  // Test Case 2
  final num2 = 1;
  print('Example 2: ${solution.findComplement(num2)}'); // Output: 0
}
