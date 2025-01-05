class Solution {
  int jump(List<int> nums) {
    var jumps = 0;
    var currentMax = 0;
    var nextMax = 0;

    for (var i = 0; i < nums.length - 1; i++) {
      nextMax = max(nextMax, i + nums[i]);

      if (i == currentMax) {
        jumps++;
        currentMax = nextMax;
      }
    }

    return jumps;
  }

  int max(int a, int b) => a > b ? a : b;
}

void main() {
  final solution = Solution();
  print(solution.jump([2, 3, 1, 1, 4])); // 2
  print(solution.jump([2, 3, 0, 1, 4])); // 2
  print(solution.jump([1, 2, 3])); // 2
}
