class Solution {
  List<int> getFinalState(List<int> nums, int k, int multiplier) {
    for (int i = 0; i < k; i++) {
      int minIndex = 0;
      for (int j = 1; j < nums.length; j++) {
        if (nums[j] < nums[minIndex]) {
          minIndex = j;
        }
      }

      nums[minIndex] *= multiplier;
    }

    return nums;
  }
}

void main() {
  Solution solution = Solution();

  List<int> nums1 = [2, 1, 3, 5, 6];
  int k1 = 5;
  int multiplier1 = 2;
  print(solution.getFinalState(
      nums1, k1, multiplier1)); // Output: [8, 4, 6, 5, 6]

  List<int> nums2 = [1, 2];
  int k2 = 3;
  int multiplier2 = 4;
  print(solution.getFinalState(nums2, k2, multiplier2)); // Output: [16, 8]
}
