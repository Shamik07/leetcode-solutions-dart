import 'dart:math';

class Solution {
  int maximumBeauty(List<int> nums, int k) {
    nums.sort();

    int left = 0;
    int maxBeauty = 0;

    for (int right = 0; right < nums.length; right++) {
      while (nums[right] - nums[left] > 2 * k) {
        left++;
      }

      // update
      maxBeauty = max(maxBeauty, right - left + 1);
    }

    return maxBeauty;
  }
}

void main() {
  Solution solution = new Solution();

  List<int> nums1 = [4, 6, 1, 2];
  int k1 = 2;
  print(solution.maximumBeauty(nums1, k1)); // Output: 3

  List<int> nums2 = [1, 1, 1, 1];
  int k2 = 10;
  print(solution.maximumBeauty(nums2, k2)); // Output: 4
}
