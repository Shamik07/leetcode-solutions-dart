class Solution {
  List<int> lexicographicallySmallestArray(List<int> nums, int limit) {
    final n = nums.length;
    final List<List<int>> pairs =
        List.generate(n, (i) => [nums[i], i], growable: false);

    pairs.sort((a, b) => a[0].compareTo(b[0]));

    final List<int> result = List.filled(n, 0);
    int i = 0;

    while (i < n) {
      int j = i;
      while (j + 1 < n && pairs[j + 1][0] - pairs[j][0] <= limit) {
        j++;
      }

      final List<int> indices = pairs
          .sublist(i, j + 1)
          .map((p) => p[1])
          .toList(growable: false)
        ..sort();

      final List<int> values =
          pairs.sublist(i, j + 1).map((p) => p[0]).toList(growable: false);

      for (int k = 0; k < indices.length; k++) {
        result[indices[k]] = values[k];
      }

      i = j + 1;
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  final nums1 = [1, 5, 3, 9, 8];
  final result1 = solution.lexicographicallySmallestArray(nums1, 2);
  print('Example 1: $result1'); // [1, 3, 5, 8, 9]

  final nums2 = [1, 7, 6, 18, 2, 1];
  final result2 = solution.lexicographicallySmallestArray(nums2, 3);
  print('Example 2: $result2'); // [1, 6, 7, 18, 1, 2]

  final nums3 = [1, 7, 28, 19, 10];
  final result3 = solution.lexicographicallySmallestArray(nums3, 3);
  print('Example 3: $result3'); // [1, 7, 28, 19, 10]
}
