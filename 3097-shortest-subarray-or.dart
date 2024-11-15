class Solution {
  int minimumSubarrayLength(List<int> nums, int k) {
    int n = nums.length;
    int left = 0, right = 0, orSum = 0, minLen = n + 1;

    while (right < n) {
      orSum |= nums[right];

      while (orSum >= k) {
        minLen = min(minLen, right - left + 1);
        // Optimization: Skip elements that won't affect the OR sum
        while (left <= right && (orSum & nums[left]) == nums[left]) {
          orSum ^= nums[left];
          left++;
        }
      }

      right++;
    }

    return minLen > n ? -1 : minLen;
  }
}
