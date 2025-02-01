class Solution {
  bool isSpecialArray(List<int> nums) {
    for (int i = 0; i < nums.length - 1; i++) {
      if ((nums[i] % 2) == (nums[i + 1] % 2)) {
        return false;
      }
    }
    return true;
  }
}

void main() {
  Solution solution = new Solution();

  List<int> nums1 = [1];
  print(solution.isSpecialArray(nums1)); // Output: true

  List<int> nums2 = [2, 1, 4];
  print(solution.isSpecialArray(nums2)); // Output: true

  List<int> nums3 = [4, 3, 1, 6];
  print(solution.isSpecialArray(nums3)); // Output: false
}
