class Solution {
  bool isPalindrome(int x) {
    if (x < 0 || (x % 10 == 0 && x != 0)) {
      return false;
    }

    int reversed = 0;
    int original = x;

    while (x > 0) {
      int digit = x % 10;
      reversed = reversed * 10 + digit;
      x ~/= 10;
    }

    return original == reversed;
  }
}

// Example Usage
void main() {
  Solution solution = new Solution();
  print(solution.isPalindrome(121)); // Output: true
  print(solution.isPalindrome(-121)); // Output: false
  print(solution.isPalindrome(10)); // Output: false
  print(solution.isPalindrome(0)); // Output: true
}
