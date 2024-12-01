import 'dart:collection';

class Solution {
  bool checkIfExist(List<int> arr) {
    final HashSet<int> seen = HashSet<int>();

    for (final num in arr) {
      if (seen.contains(2 * num) || (num % 2 == 0 && seen.contains(num ~/ 2))) {
        return true;
      }
      seen.add(num);
    }

    return false;
  }
}

void main() {
  Solution solution = new Solution();
  print(solution.checkIfExist([10, 2, 5, 3])); // Output: true
  print(solution.checkIfExist([3, 1, 7, 11])); // Output: false
}
