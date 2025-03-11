int numberOfSubstrings(String s) {
  List<int> lastPos = [-1, -1, -1];
  int result = 0;

  for (int i = 0; i < s.length; i++) {
    lastPos[s.codeUnitAt(i) - 'a'.codeUnitAt(0)] = i;
    int minPos = lastPos.reduce((min, pos) => pos < min ? pos : min);

    if (minPos != -1) {
      result += minPos + 1;
    }
  }

  return result;
}

void main() {
  // Example 1
  String s1 = "abcabc";
  print("Example 1: ${numberOfSubstrings(s1)}"); // output 10

  // Example 2
  String s2 = "aaacb";
  print("Example 2: ${numberOfSubstrings(s2)}"); //output 3
}
