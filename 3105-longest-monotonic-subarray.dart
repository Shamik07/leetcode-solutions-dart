class Solution {
  int longestMonotonicSubarray(List<int> nums) {
    if (nums.isEmpty) return 0;
    int maxLen = 1;
    int prevInc = 1;
    int prevDec = 1;
    for (int i = 1; i < nums.length; i++) {
      int currentInc = 1;
      int currentDec = 1;
      if (nums[i] > nums[i - 1]) {
        currentInc = prevInc + 1;
        currentDec = 1;
      } else if (nums[i] < nums[i - 1]) {
        currentDec = prevDec + 1;
        currentInc = 1;
      } else {
        currentInc = 1;
        currentDec = 1;
      }
      maxLen = max(maxLen, max(currentInc, currentDec));
      prevInc = currentInc;
      prevDec = currentDec;
    }
    return maxLen;
  }

  int max(int a, int b) => a > b ? a : b;
}

void main() {
  Solution solution = Solution();

  List<int> nums1 = [1, 4, 3, 3, 2];
  print(solution.longestMonotonicSubarray(nums1)); // Output: 2

  List<int> nums2 = [3, 3, 3, 3];
  print(solution.longestMonotonicSubarray(nums2)); // Output: 1

  List<int> nums3 = [3, 2, 1];
  print(solution.longestMonotonicSubarray(nums3)); // Output: 3
}
