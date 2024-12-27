class Solution {
  int maxScoreSightseeingPair(List<int> values) {
    int maxScore = 0;
    int bestI = values[0] + 0;

    for (int j = 1; j < values.length; j++) {
      maxScore = maxScore > (bestI + values[j] - j)
          ? maxScore
          : (bestI + values[j] - j);

      bestI = bestI > (values[j] + j) ? bestI : (values[j] + j);
    }

    return maxScore;
  }
}

void main() {
  Solution solution = new Solution();

  print(solution.maxScoreSightseeingPair([8, 1, 5, 2, 6])); // Output: 11
  print(solution.maxScoreSightseeingPair([1, 2])); // Output: 2
  print(solution.maxScoreSightseeingPair([1, 3, 5])); // Output: 7
}
