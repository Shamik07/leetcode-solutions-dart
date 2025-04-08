import 'dart:collection';

int minOperations(List<int> nums) {
  final seen = HashSet<int>();
  int n = nums.length;
  int distinctSuffixStart = n;

  for (int i = n - 1; i >= 0; i--) {
    if (!seen.add(nums[i])) {
      // duplicate
      distinctSuffixStart = i + 1;
      break;
    }
    // all distinct
    if (i == 0) {
      distinctSuffixStart = 0;
    }
  }

  if (distinctSuffixStart == 0) {
    return 0;
  }

  int elementsToRemove = distinctSuffixStart;

  return (elementsToRemove + 2) ~/ 3;
}

void main() {
  // Example 1
  List<int> nums1 = [1, 2, 3, 4, 2, 3, 3, 5, 7];
  int result1 = minOperations(nums1);
  print("Input: $nums1");
  print("Output: $result1"); // Expected output: 2

  print("-" * 20);

  // Example 2
  List<int> nums2 = [4, 5, 6, 4, 4];
  int result2 = minOperations(nums2);
  print("Input: $nums2");
  print("Output: $result2"); // Expected output: 2
}
