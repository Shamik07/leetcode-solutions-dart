class Solution {
  int tupleSameProduct(List<int> nums) {
    final int n = nums.length;
    if (n < 4) return 0;

    Map<int, int> productMap = {};

    for (int i = 0; i < n - 1; i++) {
      for (int j = i + 1; j < n; j++) {
        int product = nums[i] * nums[j];
        productMap[product] = (productMap[product] ?? 0) + 1;
      }
    }

    int totalTuples = 0;

    for (int count in productMap.values) {
      if (count > 1) {
        totalTuples += count * (count - 1) * 4;
      }
    }

    return totalTuples;
  }

  int combinations(int n, int r) {
    if (r > n) return 0;
    if (r * 2 > n) r = n - r;
    if (r == 0) return 1;

    int result = n;
    for (int i = 2; i <= r; i++) {
      result *= (n - i + 1);
      result ~/= i;
    }
    return result;
  }
}

void main() {
  final solution = Solution();

  // Test cases
  final testCases = [
    [2, 3, 4, 6], // Expected: 8
    [1, 2, 4, 5, 10], // Expected: 16
    [1, 2, 3, 4, 5, 6],
  ];

  for (int i = 0; i < testCases.length; i++) {
    final result = solution.tupleSameProduct(testCases[i]);
    print('Test case ${i + 1}:');
    print('Input: ${testCases[i]}');
    print('Output: $result\n');
  }
}
