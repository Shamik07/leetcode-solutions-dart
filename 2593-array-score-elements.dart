class Solution {
  int findScore(List<int> nums) {
  int n = nums.length;
  int score = 0;

  List<bool> marked = List.filled(n, false);

  List<MapEntry<int, int>> indexedNums = [
    for (int i = 0; i < n; i++) MapEntry(nums[i], i)
  ];

  indexedNums.sort((a, b) {
    if (a.key != b.key) {
      return a.key.compareTo(b.key);
    } else {
      return a.value.compareTo(b.value);
    }
  });

  for (var entry in indexedNums) {
    int value = entry.key;
    int index = entry.value;

    if (marked[index]) continue;

    score += value;

    marked[index] = true;
    if (index > 0) marked[index - 1] = true;
    if (index < n - 1) marked[index + 1] = true;
  }

  return score;
}
}



void main() {
  Solution solution = new Solution ();
  // test
  print(solution.findScore([2, 1, 3, 4, 5, 2])); // Output: 7
  print(solution.findScore([2, 3, 5, 1, 3, 2])); // Output: 5
}
