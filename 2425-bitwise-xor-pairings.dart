class Solution {
  int xorAllNums(List<int> nums1, List<int> nums2) {
    int result = 0;

    if (nums2.length % 2 == 1) {
      for (int num in nums1) {
        result ^= num;
      }
    }

    if (nums1.length % 2 == 1) {
      for (int num in nums2) {
        result ^= num;
      }
    }

    return result;
  }
}

// Example usage:
void main() {
  final solution = Solution();

  print(solution.xorAllNums([2, 1, 3], [10, 2, 5, 0])); // 13
  print(solution.xorAllNums([1, 2], [3, 4])); // 0
  print(solution.xorAllNums([1, 2, 3], [4, 5])); // 1
}
