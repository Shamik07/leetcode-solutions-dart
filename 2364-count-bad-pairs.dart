class Solution {
  int countBadPairs(List<int> nums) {
    int n = nums.length;
    Map<int, int> freq = {};

    for (int i = 0; i < n; i++) {
      int transformedValue = nums[i] - i;
      freq[transformedValue] = (freq[transformedValue] ?? 0) + 1;
    }

    int totalPairs = n * (n - 1) ~/ 2;

    int goodPairs = 0;
    for (int count in freq.values) {
      if (count >= 2) {
        goodPairs += count * (count - 1) ~/ 2;
      }
    }

    int badPairs = totalPairs - goodPairs;
    return badPairs;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.countBadPairs([4, 1, 3, 3])); // Output: 5
  print(solution.countBadPairs([1, 2, 3, 4, 5])); // Output: 0
}
