import 'dart:math';

int takeCharacters(String s, int k) {
  final int n = s.length;
  int ans = n;
  List<int> count = [0, 0, 0];

  for (var char in s.split('')) {
    count[char.codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
  }

  // Check if impossible 
  if (count[0] < k || count[1] < k || count[2] < k) return -1;

  int left = 0;
  for (int right = 0; right < n; ++right) {
    count[s[right].codeUnitAt(0) - 'a'.codeUnitAt(0)]--;
    while (count[s[right].codeUnitAt(0) - 'a'.codeUnitAt(0)] < k) {
      count[s[left].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
      left++;
    }
    ans = min(ans, n - (right - left + 1));
  }

  return ans;
}

void main() {
  print(takeCharacters("aabaaaacaabc", 2)); // Output: 8
  print(takeCharacters("a", 1)); // Output: -1
}
