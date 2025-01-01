class Solution {
  int romanToInt(String s) {
    Map<String, int> romanMap = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000
    };

    int total = 0;

    for (int i = 0; i < s.length; i++) {
      int current = romanMap[s[i]]!;
      int next = (i + 1 < s.length) ? romanMap[s[i + 1]]! : 0;

      if (current < next) {
        total -= current;
      } else {
        total += current;
      }
    }

    return total;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.romanToInt("III")); // Output: 3
  print(sol.romanToInt("LVIII")); // Output: 58
  print(sol.romanToInt("MCMXCIV")); // Output: 1994
}
