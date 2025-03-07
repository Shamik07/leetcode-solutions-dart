import 'dart:math' show max, sqrt;

class Solution {
  List<int> closestPrimes(int left, int right) {
    List<bool> isPrime = List<bool>.filled(right + 1, true);
    isPrime[0] = isPrime[1] = false;

    int sqrtRight = sqrt(right).toInt();
    for (int i = 2; i <= sqrtRight; i++) {
      if (isPrime[i]) {
        for (int j = i * i; j <= right; j += i) {
          isPrime[j] = false;
        }
      }
    }

    int prevPrime = -1;
    int minGap = 1000000;
    List<int> result = [-1, -1];

    for (int i = max(2, left); i <= right; i++) {
      if (isPrime[i]) {
        if (prevPrime != -1) {
          int gap = i - prevPrime;
          if (gap < minGap) {
            minGap = gap;
            result = [prevPrime, i];

            if (minGap == 2) {
              return result;
            }
          }
        }
        prevPrime = i;
      }
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  // [11, 13]
  final result1 = solution.closestPrimes(10, 19);
  print('Example 1 (10, 19): $result1');

  //  [-1, -1]
  final result2 = solution.closestPrimes(4, 6);
  print('Example 2 (4, 6): $result2');

  final result3 = solution.closestPrimes(80, 100);
  print('Example 3 (80, 100): $result3');
}
