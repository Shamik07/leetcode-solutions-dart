int minArrayEnd(int n, int x) {
  int minEnd(int n, int x) {
    if (n == 1) return x;

    // For n > 1, the last number must:
    // 1. Have all bits of x set (to maintain AND result)
    // 2. Be large enough to have n-1 smaller numbers before it
    // that also maintain the AND result

    // Start with x as the first number
    int result = x;

    // For each position from 1 to n-1, we need:
    // - Numbers to be strictly increasing
    // - Each number must have all bits of x
    for (int i = 0; i < n - 1; i++) {
      // Get to next number that has all bits of x
      result = (result + 1) | x;
    }

    return result;
  }
}

// Test function
void main() {
  print(minArrayEnd(3, 4)); // Should output 6
  print(minArrayEnd(2, 5)); // Test case 2
  print(minArrayEnd(4, 8)); // Additional test case
}
