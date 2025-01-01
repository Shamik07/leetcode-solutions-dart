class Solution {
  int removeElement(List<int> nums, int val) {
    int k = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != val) {
        nums[k] = nums[i];
        k++;
      }
    }
    return k;
  }
}

void main() {
  Solution sol = Solution();
  List<int> nums1 = [3, 2, 2, 3];
  print(sol.removeElement(nums1, 3)); // Output: 2 (nums1 could be [2, 2, _, _])
  
  List<int> nums2 = [0, 1, 2, 2, 3, 0, 4, 2];
  print(sol.removeElement(nums2, 2)); // Output: 5 (nums2 could be [0, 1, 4, 0, 3, _, _, _])
}
