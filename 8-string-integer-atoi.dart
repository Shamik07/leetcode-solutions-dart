class Solution {
  int myAtoi(String s) {
    int i = 0, sign = 1, result = 0;
    int n = s.length;

    while (i < n && s[i] == ' ') {
      i++;
    }

    if (i < n && (s[i] == '+' || s[i] == '-')) {
      sign = (s[i] == '-') ? -1 : 1;
      i++;
    }

    while (i < n &&
        s[i].codeUnitAt(0) >= '0'.codeUnitAt(0) &&
        s[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
      int digit = s[i].codeUnitAt(0) - '0'.codeUnitAt(0);

      if (result > (1 << 31) ~/ 10 ||
          (result == (1 << 31) ~/ 10 && digit > 7)) {
        return sign == 1 ? (1 << 31) - 1 : -(1 << 31);
      }

      result = result * 10 + digit;
      i++;
    }

    return result * sign;
  }
}

// Example Usage
void main() {
  Solution solution = new Solution();
  print(solution.myAtoi("42")); // Output: 42
  print(solution.myAtoi("   -042")); // Output: -42
  print(solution.myAtoi("1337c0d3")); // Output: 1337
  print(solution.myAtoi("0-1")); // Output: 0
  print(solution.myAtoi("words and 987")); // Output: 0
  print(solution.myAtoi("-91283472332")); // Output: -2147483648 (overflow)
}
