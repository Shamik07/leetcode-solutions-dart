class Solution {
  int minCapability(List<int> nums, int k) {
    int left = nums.reduce((min, num) => min < num ? min : num);
    int right = nums.reduce((max, num) => max > num ? max : num);
    
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      
      if (canRob(nums, k, mid)) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }
    
    return left;
  }
  
  bool canRob(List<int> nums, int k, int capability) {
    int count = 0;
    int i = 0;
    
    while (i < nums.length) {
      if (nums[i] <= capability) {
        count++;
        i += 2; // Skip the adjacent house
      } else {
        i += 1; // Move to the next house
      }
    }
    
    return count >= k;
  }
}

void main() {
  final solution = Solution();
  
  final nums1 = [2, 3, 5, 9];
  final k1 = 2;
  print('Example 1: ${solution.minCapability(nums1, k1)}'); // Expected output: 5
  
  final nums2 = [2, 7, 9, 3, 1];
  final k2 = 2;
  print('Example 2: ${solution.minCapability(nums2, k2)}'); // Expected output: 2
  
  final nums3 = [1, 6, 3, 5, 8, 4];
  final k3 = 3;
  print('Example 3: ${solution.minCapability(nums3, k3)}'); // Expected output: 4
}