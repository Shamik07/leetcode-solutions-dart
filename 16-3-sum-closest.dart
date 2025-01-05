class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    final n = nums.length;
    var closestSum = nums[0] + nums[1] + nums[2];

    if (target <= closestSum) return closestSum;
    final largestSum = nums[n - 3] + nums[n - 2] + nums[n - 1];
    if (target >= largestSum) return largestSum;

    for (var i = 0; i < n - 2; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      var left = i + 1;
      var right = n - 1;

      while (left < right) {
        final sum = nums[i] + nums[left] + nums[right];
        if (sum == target) return target;

        if ((sum - target).abs() < (closestSum - target).abs()) {
          closestSum = sum;
        }

        if (sum < target) {
          left++;
        } else {
          right--;
        }
      }
    }
    return closestSum;
  }
}

void main() {
  final solution = Solution();
  print(solution.threeSumClosest([-1, 2, 1, -4], 1)); // 2
  print(solution.threeSumClosest([0, 0, 0], 1)); // 0
  print(solution.threeSumClosest([1, 1, 1, 0], 100)); // 3
}
