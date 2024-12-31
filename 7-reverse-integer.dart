class Solution {
  int reverse(int x) {
    int sign = x < 0 ? -1 : 1;
    int absX = x.abs();
    int reversed = 0;

    while (absX > 0) {
      int digit = absX % 10;
      absX ~/= 10;

      if (reversed > (1 << 31) ~/ 10 ||
          (reversed == (1 << 31) ~/ 10 && digit > 7)) {
        return 0;
      }

      reversed = reversed * 10 + digit;
    }

    return reversed * sign;
  }
}

// Example Usage
void main() {
  Solution solution = new Solution();

  print(solution.reverse(123)); // Output: 321
  print(solution.reverse(-123)); // Output: -321
  print(solution.reverse(120)); // Output: 21
  print(solution.reverse(0)); // Output: 0
  print(solution.reverse(1534236469)); // Output: 0 (overflow)
}
