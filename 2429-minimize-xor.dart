class Solution {
  int minimizeXor(int num1, int num2) {
    int setBits = _countSetBits(num2);
    int result = 0;

    for (int bit = 31; bit >= 0 && setBits > 0; bit--) {
      if ((num1 & (1 << bit)) != 0) {
        result |= (1 << bit);
        setBits--;
      }
    }

    for (int bit = 0; bit < 32 && setBits > 0; bit++) {
      if ((num1 & (1 << bit)) == 0) {
        result |= (1 << bit);
        setBits--;
      }
    }

    return result;
  }

  int _countSetBits(int n) {
    int count = 0;
    while (n != 0) {
      count += n & 1;
      n >>= 1;
    }
    return count;
  }
}

void main() {
  final solution = Solution();

  print(solution.minimizeXor(3, 5)); // Output: 3
  print(solution.minimizeXor(1, 12)); // Output: 3
}
