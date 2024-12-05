class Solution {
  bool canChange(String start, String target) {
    int n = start.length;
    String sFiltered = start.replaceAll('_', '');
    String tFiltered = target.replaceAll('_', '');

    if (sFiltered != tFiltered) {
      return false;
    }

    int i = 0, j = 0;

    while (i < n && j < n) {
      while (i < n && start[i] == '_') i++;

      while (j < n && target[j] == '_') j++;

      if (i == n && j == n) {
        return true;
      }

      if (i == n || j == n) {
        return false;
      }

      if (start[i] != target[j]) {
        return false;
      }

      // movement rules
      if (start[i] == 'L' && j > i) {
        return false;
      }
      if (start[i] == 'R' && j < i) {
        return false;
      }

      i++;
      j++;
    }

    return true;
  }
}

void main() {
  Solution solution = new Solution();
  print(solution.canChange("_L__R__R_", "L______RR")); // Output: true
  print(solution.canChange("R_L_", "__LR")); // Output: false
  print(solution.canChange("_R", "R_")); // Output: false
}
