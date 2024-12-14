class Solution {
  int continuousSubarrays(List<int> nums) {
    int n = nums.length;
    int left = 0;
    int count = 0;

    int minVal = nums[0];
    int maxVal = nums[0];

    for (int right = 0; right < n; right++) {
      minVal = nums[right] < minVal ? nums[right] : minVal;
      maxVal = nums[right] > maxVal ? nums[right] : maxVal;

      while ((maxVal - minVal) > 2) {
        left++;
        minVal = nums[left];
        maxVal = nums[left];
        for (int i = left; i <= right; i++) {
          minVal = nums[i] < minVal ? nums[i] : minVal;
          maxVal = nums[i] > maxVal ? nums[i] : maxVal;
        }
      }

      count += (right - left + 1);
    }

    return count;
  }
}

void main() {
  Solution solution = new Solution();

  List<int> nums1 = [5, 4, 2, 4];
  print(solution.continuousSubarrays(nums1)); // Output: 8

  List<int> nums2 = [1, 2, 3];
  print(solution.continuousSubarrays(nums2)); // Output: 6

  List<int> nums3 = [65, 66, 67, 66, 66, 65, 64, 65, 65, 64];
  print(solution.continuousSubarrays(nums3)); // Output: 43
}
