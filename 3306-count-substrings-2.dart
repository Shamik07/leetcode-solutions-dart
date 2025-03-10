int a = 'a'.codeUnitAt(0);
bool isCons(String s) => !['a', 'e', 'i', 'o', 'u'].contains(s);
bool isAllVowPresent(List<int> freq) =>
    freq['a'.codeUnitAt(0) - a] > 0 &&
    freq['e'.codeUnitAt(0) - a] > 0 &&
    freq['i'.codeUnitAt(0) - a] > 0 &&
    freq['o'.codeUnitAt(0) - a] > 0 &&
    freq['u'.codeUnitAt(0) - a] > 0;

int countOfSubstrings(String word, int k) {
  return atleast(k, word) - atleast(k + 1, word);
}

int atleast(int k, String word) {
  int count = 0, cons = 0, left = 0, n = word.length;
  List<int> freq = List.filled(26, 0);

  for (int right = 0; right < n; right++) {
    String ch = word[right];
    if (isCons(ch)) cons++;

    freq[ch.codeUnitAt(0) - a]++;

    while (cons >= k && isAllVowPresent(freq)) {
      count += (n - right);
      String c = word[left];
      if (isCons(c)) cons--;
      freq[c.codeUnitAt(0) - a]--;
      left++;
    }
  }
  return count;
}

void main() {
  String word1 = "aeioqq";
  int k1 = 1;
  print("Example 1: ${countOfSubstrings(word1, k1)}"); // Expected: 0

  String word2 = "aeiou";
  int k2 = 0;
  print("Example 2: ${countOfSubstrings(word2, k2)}"); // Expected: 1

  String word3 = "ieaouqqieaouqq";
  int k3 = 1;
  print("Example 3: ${countOfSubstrings(word3, k3)}"); // Expected: 3
}
