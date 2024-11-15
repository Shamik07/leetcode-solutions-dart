int minChangesToMakeBeautiful(String s) {
  int changes = 0;

  for (int i = 0; i < s.length; i += 2) {
    if (s[i] != s[i + 1]) {
      changes++;
    }
  }

  return changes;
}

void main() {
  print(minChangesToMakeBeautiful("1001")); // Output: 2
  print(minChangesToMakeBeautiful("10")); // Output: 1
  print(minChangesToMakeBeautiful("0000")); // Output: 0
}
