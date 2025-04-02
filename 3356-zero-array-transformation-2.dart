class Solution {
  int minimumQueries(List<int> nums, List<List<int>> queries) {
    bool allZero = true;
    for (int num in nums) {
      if (num > 0) {
        allZero = false;
        break;
      }
    }
    if (allZero) return 0;

    int left = 1;
    int right = queries.length;
    int result = -1;

    while (left <= right) {
      int mid = left + ((right - left) >> 1);

      if (canMakeZero(nums, queries, mid)) {
        result = mid;
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }

    return result;
  }

  bool canMakeZero(List<int> nums, List<List<int>> queries, int k) {
    int n = nums.length;
    List<int> diff = List<int>.filled(n + 2, 0);

    for (int i = 0; i < k; i++) {
      int l = queries[i][0];
      int r = queries[i][1];
      int val = queries[i][2];

      diff[l] += val;
      if (r + 1 < diff.length) {
        diff[r + 1] -= val;
      }
    }

    int current = 0;
    for (int i = 0; i < n; i++) {
      current += diff[i];
      if (nums[i] > current) {
        return false;
      }
    }

    return true;
  }
}

void main() {
  final solution = Solution();

  // Example 1
  List<int> nums1 = [2, 0, 2];
  List<List<int>> queries1 = [
    [0, 2, 1],
    [0, 2, 1],
    [1, 1, 3]
  ];
  print(solution.minimumQueries(nums1, queries1)); // Expected: 2

  // Example 2
  List<int> nums2 = [4, 3, 2, 1];
  List<List<int>> queries2 = [
    [1, 3, 2],
    [0, 2, 1]
  ];
  print(solution.minimumQueries(nums2, queries2)); // Expected: 3

  // Large test case
  List<int> nums3 = [1, 2, 3, 4, 5];
  List<List<int>> queries3 = [
    [0, 4, 1],
    [1, 3, 2],
    [2, 2, 5]
  ];
  print(solution.minimumQueries(nums3, queries3)); // Expected: 3

  // Edge case - already zero array
  List<int> nums4 = [0, 0, 0];
  List<List<int>> queries4 = [
    [0, 2, 1]
  ];
  print(solution.minimumQueries(nums4, queries4)); // Expected: 0
}
