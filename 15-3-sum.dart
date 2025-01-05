class Solution {
  List<List<int>> threeSum(List<int> nums) {
    final result = <List<int>>[];
    if (nums.length < 3) return result;

    nums.sort();
    final n = nums.length;

    if (nums[0] > 0) return result;

    if (nums[n - 1] < 0) return result;

    for (var i = 0; i < n - 2; i++) {
      if (nums[i] > 0) break;
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      // possible sums
      if (nums[i] + nums[i + 1] + nums[i + 2] > 0) break;
      if (nums[i] + nums[n - 2] + nums[n - 1] < 0) continue;

      var left = i + 1;
      var right = n - 1;

      while (left < right) {
        final sum = nums[i] + nums[left] + nums[right];

        if (sum == 0) {
          result.add([nums[i], nums[left], nums[right]]);

          final leftVal = nums[left];
          final rightVal = nums[right];
          while (left < right && nums[left] == leftVal) left++;
          while (left < right && nums[right] == rightVal) right--;
        } else {
          if (sum < 0) {
            final leftVal = nums[left];
            while (left < right && nums[left] == leftVal) left++;
          } else {
            final rightVal = nums[right];
            while (left < right && nums[right] == rightVal) right--;
          }
        }
      }
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  print(solution.threeSum([-1, 0, 1, 2, -1, -4])); // [[-1,-1,2],[-1,0,1]]

  print(solution.threeSum([0, 1, 1])); // []

  print(solution.threeSum([0, 0, 0])); // [[0,0,0]]

  print(solution.threeSum([-2, 0, 1, 1, 2])); // [[-2,0,2],[-2,1,1]]
  print(solution.threeSum([-4, -2, -2, -2, 0, 1, 2, 2, 2, 3, 3, 4, 4, 6, 6]));
}
