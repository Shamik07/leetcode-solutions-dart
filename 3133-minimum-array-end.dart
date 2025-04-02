int minArrayEnd(int n, int x) {
  if (n == 1) return x;
  int result = x;
  for (int i = 0; i < n - 1; i++) {
    result = (result + 1) | x;
  }

  return result;
}

// Test function
void main() {
  print(minArrayEnd(3, 4)); // Should output 6
  print(minArrayEnd(2, 5)); // Test case 2
  print(minArrayEnd(4, 8)); // Additional test case
}
