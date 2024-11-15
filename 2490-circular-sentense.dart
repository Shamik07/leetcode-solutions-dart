bool isCircularSentence(String sentence) {
  List<String> words = sentence.split(' ');

  for (int i = 0; i < words.length; i++) {
    String lastChar = words[i][words[i].length - 1];
    String firstChar = words[(i + 1) % words.length][0];

  
    if (lastChar != firstChar) {
      return false;
    }
  }

  return true;
}

void main() {
  print(isCircularSentence("leetcode exercises sound delightful")); // true
  print(isCircularSentence("eetcode")); // true
  print(isCircularSentence("Leetcode is cool")); // false
}
