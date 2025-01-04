class Solution {
  int waysToSplitArray(List<int> nums) {
    if (nums.length < 2) return 0;

    int validSplits = 0;
    int n = nums.length;

    int totalSum = 0;
    for (int num in nums) {
      totalSum += num;
    }

    int leftSum = 0;
    for (int i = 0; i < n - 1; i++) {
      leftSum += nums[i];
      int rightSum = totalSum - leftSum;

      if (leftSum >= rightSum) {
        validSplits++;
      }
    }

    return validSplits;
  }
}

void main() {
  Solution solution = Solution();

  List<int> nums1 = [10, 4, -8, 7];
  print('Test case 1: ${solution.waysToSplitArray(nums1)}'); // Expected: 2

  List<int> nums2 = [2, 3, 1, 0];
  print('Test case 2: ${solution.waysToSplitArray(nums2)}'); // Expected: 2

  List<int> nums3 = [-1, -1, -1, -1];
  print('Test case 3: ${solution.waysToSplitArray(nums3)}'); // Expected 2

  List<int> nums4 = [100000, -100000];
  print('Test case 4: ${solution.waysToSplitArray(nums4)}'); // Expected 1
}
