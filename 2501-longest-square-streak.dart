int longestSquareStreak(List<int> nums) {
  nums.sort();
  Set<int> numSet = nums.toSet();
  int longestStreak = -1;

  for (int num in nums) {
    int current = num;
    int streakLength = 1;

    while (numSet.contains(current * current)) {
      current = current * current;
      streakLength++;
    }

    if (streakLength >= 2) {
      longestStreak =
          longestStreak > streakLength ? longestStreak : streakLength;
    }
  }

  return longestStreak;
}

void main() {
  print(longestSquareStreak([4, 3, 6, 16, 8, 2])); // Output: 3
  print(longestSquareStreak([2, 3, 5, 6, 7])); // Output: -1
}
