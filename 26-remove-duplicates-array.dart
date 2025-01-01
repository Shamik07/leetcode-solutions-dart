class Solution {
  int removeDuplicates(List<int> nums) {
    if (nums.isEmpty) return 0;

    int j = 0; 

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] != nums[j]) {
        j++;
        nums[j] = nums[i]; 
      }
    }

    return j + 1; 
  }
}

void main() {
  Solution sol = Solution();
  List<int> nums1 = [1, 1, 2];
  print(sol.removeDuplicates(nums1)); // Output: 2, nums = [1, 2, _]

  List<int> nums2 = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];
  print(sol.removeDuplicates(nums2)); // Output: 5, nums = [0, 1, 2, 3, 4, _, _, _, _, _]
}
