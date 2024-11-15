class Solution {
  List<int>? twoSum(List<int> nums, int target) {
    final Map<int, int> hashMap = {};

    for (int i = 0; i < nums.length; i++) {
      int diff = target - nums[i];

      if (hashMap.containsKey(diff)) {
        return [hashMap[diff]!, i]; // Return since match found
      }

      hashMap[nums[i]] = i;
    }

    return null;
  }
}

void main() {
  Solution solution = Solution();
  List<int>? result = solution.twoSum([2, 7, 11, 15], 9);
  if (result != null) {
    print("Answer: ${result}");
  } else {
    print('No solution');
  }
}
