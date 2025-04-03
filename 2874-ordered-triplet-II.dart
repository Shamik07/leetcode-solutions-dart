import 'dart:math';

class Solution {
  int maximumTripletValue(List<int> nums) {
    int n = nums.length;
    if (n < 3) {
      return 0; // Not triplet
    }

    int maxVal = 0;
    int maxI = 0;
    int maxDiff = 0;

    for (int num in nums) {
      int currentTripletValue = maxDiff * num;
      maxVal = max(maxVal, currentTripletValue);
      maxDiff = max(maxDiff, maxI - num);
      maxI = max(maxI, num);
    }

    return maxVal;
  }
}

void main() {
  Solution sol = Solution();

  // Example 1
  List<int> nums1 = [12, 6, 1, 2, 7];
  int output1 = sol.maximumTripletValue(nums1);
  print("Input: nums = $nums1");
  print("Output: $output1"); // Expected: 77
  print("-" * 20);

  // Example 2
  List<int> nums2 = [1, 10, 3, 4, 19];
  int output2 = sol.maximumTripletValue(nums2);
  print("Input: nums = $nums2");
  print("Output: $output2"); // Expected: 133
  print("-" * 20);

  // Example 3
  List<int> nums3 = [1, 2, 3];
  int output3 = sol.maximumTripletValue(nums3);
  print("Input: nums = $nums3");
  print("Output: $output3"); // Expected: 0
  print("-" * 20);
}
