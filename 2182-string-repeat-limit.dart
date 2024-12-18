class Solution {
  String repeatLimitedString(String s, int repeatLimit) {
    Map<String, int> frequency = {};
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      frequency[c] = (frequency[c] ?? 0) + 1;
    }

    List<String> chars = frequency.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    StringBuffer result = StringBuffer();
    int i = 0;

    while (i < chars.length) {
      String currentChar = chars[i];
      int currentFreq = frequency[currentChar]!;
      int count = 0;

      while (count < repeatLimit && currentFreq > 0) {
        result.write(currentChar);
        currentFreq--;
        count++;
      }

      frequency[currentChar] = currentFreq;

      if (currentFreq > 0) {
        int j = i + 1;
        while (j < chars.length && frequency[chars[j]] == 0) {
          j++;
        }

        if (j >= chars.length) break;

        String nextChar = chars[j];
        result.write(nextChar);

        frequency[nextChar] = frequency[nextChar]! - 1;
      } else {
        i++;
      }
    }

    return result.toString();
  }
}

void main() {
  Solution solution = Solution();

  print(solution.repeatLimitedString("cczazcc", 3)); // Output: "zzcccac"
  print(solution.repeatLimitedString("aababab", 2)); // Output: "bbabaa"
}
