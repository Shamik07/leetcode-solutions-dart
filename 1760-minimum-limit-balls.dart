class Solution {
  int minimumSize(List<int> nums, int maxOperations) {
    int left = 1;
    int right = nums.reduce((a, b) => a > b ? a : b); // maximum balls
    while (left < right) {
      int mid = (left + right) ~/ 2;
      int operations = 0;

      for (int num in nums) {
        if (num > mid) {
          operations += (num - 1) ~/ mid;
        }
      }

      if (operations <= maxOperations) {
        right = mid;
      } else {
        left = mid + 1;
      }
    }

    return left;
  }
}

void main() {
  Solution solution = Solution();

  print(solution.minimumSize([9], 2)); // Output: 3

  print(solution.minimumSize([2, 4, 8, 2], 4)); // Output: 2
}
