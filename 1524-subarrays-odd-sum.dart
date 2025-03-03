class Solution {
  int numOfSubarrays(List<int> arr) {
    const int MOD = 1000000007;
    int prefixSum = 0;
    int oddCount = 0;
    int evenCount = 1;
    int result = 0;

    for (int num in arr) {
      prefixSum += num;
      if (prefixSum % 2 == 1) {
        result = (result + evenCount) % MOD;
        oddCount++;
      } else {
        result = (result + oddCount) % MOD;
        evenCount++;
      }
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.numOfSubarrays([1, 3, 5])); // 4

  // Test Case 2
  print(solution.numOfSubarrays([2, 4, 6])); // 0

  // Test Case 3
  print(solution.numOfSubarrays([1, 2, 3, 4, 5])); // 9
}
