class Solution {
  bool checkPowersOfThree(int n) {
    while (n > 0) {
      int remainder = n % 3;
      if (remainder == 2) {
        return false;
      }
      n = n ~/ 3;
    }
    return true;
  }
}

void main() {
  Solution solution = Solution();

  int n1 = 12;
  print(solution.checkPowersOfThree(n1)); // Output: true

  int n2 = 91;
  print(solution.checkPowersOfThree(n2)); // Output: true

  int n3 = 21;
  print(solution.checkPowersOfThree(n3)); // Output: false
}
