class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    final result = <List<int>>[];
    if (nums.length < 4) return result;

    nums.sort();
    final n = nums.length;

    for (var i = 0; i < n - 3; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      for (var j = i + 1; j < n - 2; j++) {
        if (j > i + 1 && nums[j] == nums[j - 1]) continue;

        var left = j + 1;
        var right = n - 1;

        while (left < right) {
          final sum = nums[i] + nums[j] + nums[left] + nums[right];

          if (sum == target) {
            result.add([nums[i], nums[j], nums[left], nums[right]]);

            while (left < right && nums[left] == nums[left + 1]) left++;
            while (left < right && nums[right] == nums[right - 1]) right--;

            left++;
            right--;
          } else if (sum < target) {
            left++;
          } else {
            right--;
          }
        }
      }
    }

    return result;
  }
}

void main() {
  final solution = Solution();
  print(solution
      .fourSum([1, 0, -1, 0, -2, 2], 0)); // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
  print(solution.fourSum([2, 2, 2, 2, 2], 8)); // [[2,2,2,2]]
  print(solution.fourSum([0, 0, 0, 0], 0)); // [[0,0,0,0]]
}
