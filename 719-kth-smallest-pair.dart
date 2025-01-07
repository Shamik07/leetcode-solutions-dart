class Solution {
  int smallestDistancePair(List<int> nums, int k) {
    nums.sort();

    // bs
    int left = 0;
    int right = nums.last - nums.first;

    while (left < right) {
      int mid = left + (right - left) ~/ 2;

      if (countPairsWithinDistance(nums, mid) >= k) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left;
  }

  int countPairsWithinDistance(List<int> nums, int target) {
    int count = 0;
    int left = 0;

    for (int right = 1; right < nums.length; right++) {
      while (nums[right] - nums[left] > target) {
        left++;
      }
      count += right - left;
    }

    return count;
  }
}

void main() {
  final solution = Solution();

  // Example 1
  final nums1 = [1, 3, 1];
  print('Example 1: ${solution.smallestDistancePair(nums1, 1)}'); // 0

  // Example 2
  final nums2 = [1, 1, 1];
  print('Example 2: ${solution.smallestDistancePair(nums2, 2)}'); // 0

  // Example 3
  final nums3 = [1, 6, 1];
  print('Example 3: ${solution.smallestDistancePair(nums3, 3)}'); // 5
}
