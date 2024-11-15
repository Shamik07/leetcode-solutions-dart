import 'dart:math';

class Solution {
  int minimumMountainRemovals(List<int> nums) {
    int n = nums.length;

    // Step 1: Compute LIS from the left for each index
    List<int> lis = List<int>.filled(n, 1);
    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] > nums[j]) {
          lis[i] = max(lis[i], lis[j] + 1);
        }
      }
    }

    // Step 2: Compute LDS from the right for each index
    List<int> lds = List<int>.filled(n, 1);
    for (int i = n - 2; i >= 0; i--) {
      for (int j = n - 1; j > i; j--) {
        if (nums[i] > nums[j]) {
          lds[i] = max(lds[i], lds[j] + 1);
        }
      }
    }

    // Step 3: Find the maximum mountain length
    int maxMountainLength = 0;
    for (int i = 1; i < n - 1; i++) {
      if (lis[i] > 1 && lds[i] > 1) {
        maxMountainLength = max(maxMountainLength, lis[i] + lds[i] - 1);
      }
    }

    // Step 4: Calculate the minimum removals needed
    return n - maxMountainLength;
  }
}

void main() {
  Solution solution = Solution();

  // Test case 1
  List<int> nums1 = [1, 3, 1];
  print("Output for [1,3,1]: ${solution.minimumMountainRemovals(nums1)}");
  // Expected output: 0

  // Test case 2
  List<int> nums2 = [2, 1, 1, 5, 6, 2, 3, 1];
  print(
      "Output for [2,1,1,5,6,2,3,1]: ${solution.minimumMountainRemovals(nums2)}");
  // Expected output: 3
}
