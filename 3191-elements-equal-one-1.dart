int minOperations(List<int> nums) {
  int n = nums.length;
  int operations = 0;

  for (int i = 0; i <= n - 3; i++) {
    if (nums[i] == 0) {
      nums[i] ^= 1;
      nums[i + 1] ^= 1;
      nums[i + 2] ^= 1;
      operations++;
    }
  }

  for (int i = n - 2; i < n; i++) {
    if (nums[i] == 0) {
      return -1;
    }
  }

  return operations;
}

void main() {
  // Example 1
  List<int> nums1 = [0, 1, 1, 1, 0, 0];
  print(minOperations(nums1)); // Output: 3

  // Example 2
  List<int> nums2 = [0, 1, 1, 1];
  print(minOperations(nums2)); // Output: -1

  // Example 3
  List<int> nums3 = [0, 0, 0, 1, 1, 1];
  print(minOperations(nums3)); // Output: 1
}
