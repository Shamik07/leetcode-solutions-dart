class Solution {
  int minimumLength(String s) {
    List<bool> deleted = List.filled(s.length, false);
    bool changed = true;
    int remainingChars = s.length;

    while (changed) {
      changed = false;

      for (int i = 0; i < s.length; i++) {
        if (deleted[i]) continue;

        // closest left
        int left = -1;
        for (int j = i - 1; j >= 0; j--) {
          if (!deleted[j] && s[j] == s[i]) {
            left = j;
            break;
          }
        }

        // closest right
        int right = -1;
        for (int j = i + 1; j < s.length; j++) {
          if (!deleted[j] && s[j] == s[i]) {
            right = j;
            break;
          }
        }

        // both
        if (left != -1 && right != -1) {
          deleted[left] = true;
          deleted[right] = true;
          remainingChars -= 2;
          changed = true;
        }
      }
    }

    return remainingChars;
  }
}

void main() {
  final solution = Solution();

  print('Test 1: ${solution.minimumLength("abaacbcbb")}'); // 5
  print('Test 2: ${solution.minimumLength("aa")}'); // 2
}
