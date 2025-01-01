class Solution {
  int maxScore(String s) {
    int totalOnes = s.split('').where((c) => c == '1').length;
    int maxScore = 0;
    int leftZeros = 0, rightOnes = totalOnes;

    for (int i = 0; i < s.length - 1; i++) {
      if (s[i] == '0') {
        leftZeros++;
      } else {
        rightOnes--;
      }
      maxScore = maxScore > (leftZeros + rightOnes)
          ? maxScore
          : (leftZeros + rightOnes);
    }

    return maxScore;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.maxScore("011101")); // Output: 5
  print(sol.maxScore("00111")); // Output: 5
  print(sol.maxScore("1111")); // Output: 3
}
