class Solution {
  List<int> constructDistancedSequence(int n) {
    int length = 2 * n - 1;
    List<int> sequence = List.filled(length, 0);
    List<bool> used = List.filled(n + 1, false);

    bool backtrack(int index) {
      if (index == length) {
        return true;
      }

      if (sequence[index] != 0) {
        return backtrack(index + 1);
      }

      for (int i = n; i >= 1; i--) {
        if (used[i]) continue;

        if (i == 1) {
          sequence[index] = 1;
          used[i] = true;
          if (backtrack(index + 1)) {
            return true;
          }
          sequence[index] = 0;
          used[i] = false;
        } else {
          if (index + i < length && sequence[index + i] == 0) {
            sequence[index] = i;
            sequence[index + i] = i;
            used[i] = true;
            if (backtrack(index + 1)) {
              return true;
            }
            sequence[index] = 0;
            sequence[index + i] = 0;
            used[i] = false;
          }
        }
      }

      return false;
    }

    backtrack(0);
    return sequence;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.constructDistancedSequence(3)); // [3, 1, 2, 3, 2]

  // Test Case 2
  print(solution.constructDistancedSequence(5)); // [5, 3, 1, 4, 3, 5, 2, 4, 2]

  // Test Case 3
  print(solution.constructDistancedSequence(4)); // [4, 2, 3, 2, 4, 3, 1]
}
