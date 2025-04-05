int subsetXORSum(List<int> nums) {
  if (nums.isEmpty) {
    return 0;
  }

  int orSum = 0;
  for (int num in nums) {
    orSum |= num;
  }

  // bit shift
  int multiplier = 1 << (nums.length - 1);

  return orSum * multiplier;
}

void main() {
  // Example 1
  List<int> nums1 = [1, 3];
  int result1 = subsetXORSum(nums1);
  print("Input: $nums1, Output: $result1"); // Expected: 6

  // Example 2
  List<int> nums2 = [5, 1, 6];
  int result2 = subsetXORSum(nums2);
  print("Input: $nums2, Output: $result2"); // Expected: 28

  // Example 3
  List<int> nums3 = [3, 4, 5, 6, 7, 8];
  int result3 = subsetXORSum(nums3);
  print("Input: $nums3, Output: $result3"); // Expected: 480
}
