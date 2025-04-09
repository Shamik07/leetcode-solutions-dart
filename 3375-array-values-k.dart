import 'dart:collection';

int minimumOperationsToMakeEqual(List<int> nums, int k) {
  final Set<int> distinctGreaterValues = HashSet<int>();

  for (final int num in nums) {
    if (num < k) {
      return -1;
    } else if (num > k) {
      distinctGreaterValues.add(num);
    }
  }
  return distinctGreaterValues.length;
}

void main() {
  // Example 1
  List<int> nums1 = [5, 2, 5, 4, 5];
  int k1 = 2;
  int result1 = minimumOperationsToMakeEqual(nums1, k1);
  print(
      "Example 1: nums = ${nums1}, k = ${k1} -> Output: ${result1}"); // Expected: 2

  // Example 2
  List<int> nums2 = [2, 1, 2];
  int k2 = 2;
  int result2 = minimumOperationsToMakeEqual(nums2, k2);
  print(
      "Example 2: nums = ${nums2}, k = ${k2} -> Output: ${result2}"); // Expected: -1

  // Example 3
  List<int> nums3 = [9, 7, 5, 3];
  int k3 = 1;
  int result3 = minimumOperationsToMakeEqual(nums3, k3);
  print(
      "Example 3: nums = ${nums3}, k = ${k3} -> Output: ${result3}"); // Expected: 4
}
