String compressString(String word) {
  StringBuffer compressed = StringBuffer();
  int i = 0;

  while (i < word.length) {
    int count = 1;
    while (i + count < word.length && word[i] == word[i + count] && count < 9) {
      count++;
    }
    compressed.write('$count${word[i]}');
    i += count;
  }

  return compressed.toString();
}

void main() {
  print(compressString("abcde")); // Output: "1a1b1c1d1e"
  print(compressString("aaaaaaaaaaaaaabb")); // Output: "9a5a2b"
}
