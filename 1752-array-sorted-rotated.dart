class Solution {
  bool check(List<int> nums) {
    int count = 0;
    for (int i = 0; i < nums.length - 1; i++) {
      if (nums[i] > nums[i + 1]) {
        count++;
      }
    }

    if (nums[nums.length - 1] > nums[0]) {
      count++;
    }

    return count <= 1;
  }
}

void main() {
  Solution solution = new Solution();

  List<int> nums1 = [3, 4, 5, 1, 2];
  print(solution.check(nums1)); // Output: true

  List<int> nums2 = [2, 1, 3, 4];
  print(solution.check(nums2)); // Output: false

  List<int> nums3 = [1, 2, 3];
  print(solution.check(nums3)); // Output: true
}
