class Solution {
  bool canSortArray(List<int> nums) {
    int countSetBits(int n) {
      int count = 0;
      while (n > 0) {
        count += n & 1;
        n >>= 1;
      }
      return count;
    }

    // check if any required swaps would be invalid
    for (int i = 0; i < nums.length - 1; i++) {
      for (int j = 0; j < nums.length - 1 - i; j++) {
        // If next number is smaller, they need to be swapped
        if (nums[j] > nums[j + 1]) {
          // Check if swap is allowed
          if (countSetBits(nums[j]) != countSetBits(nums[j + 1])) {
            return false;
          }
          // Perform the swap
          int temp = nums[j];
          nums[j] = nums[j + 1];
          nums[j + 1] = temp;
        }
      }
    }
    return true;
  }
}

void main() {
  var solution = Solution();
  print(solution.canSortArray([8, 4, 2, 30, 15])); // true
  print(solution.canSortArray([1, 2, 3, 4, 5])); // true
  print(solution.canSortArray([3, 16, 8, 4, 2])); // false
  print(solution.canSortArray([75, 34, 30])); // false
}
