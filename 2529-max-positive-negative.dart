class Solution {
  int maximumCount(List<int> nums) {
    // small arrays
    if (nums.length < 50) {
      int negCount = 0;
      int posCount = 0;
      
      for (int num in nums) {
        if (num < 0) negCount++;
        else if (num > 0) posCount++;
      }
      
      return negCount > posCount ? negCount : posCount;
    }
    
    // large arrays
    int negativeEnd = binarySearch(nums, 0);
    int positiveStart = binarySearch(nums, 1);
    
    int negCount = negativeEnd;
    int posCount = nums.length - positiveStart;
    
    return negCount > posCount ? negCount : posCount;
  }
  
  int binarySearch(List<int> nums, int target) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left <= right) {
      int mid = left + ((right - left) >> 1);
      
      if (nums[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    
    return left;
  }
}

void main() {
  final solution = Solution();
  
  // Example 1
  final nums1 = [-2, -1, -1, 1, 2, 3];
  print("Example 1: ${solution.maximumCount(nums1)}"); // Expected: 3

  // Example 2
  final nums2 = [-3, -2, -1, 0, 0, 1, 2];
  print("Example 2: ${solution.maximumCount(nums2)}"); // Expected: 3

  // Example 3
  final nums3 = [5, 20, 66, 1314];
  print("Example 3: ${solution.maximumCount(nums3)}"); // Expected: 4
}