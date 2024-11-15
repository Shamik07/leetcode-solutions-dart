class Solution {
  static const int kMax = 1000;

  bool primeSubOperation(List<int> nums) {
    List<int> primes = primeDetector(kMax);

    int prevNum = 0;
    for (int num in nums) {
      // Find the smallest prime number greater than or equal to num - prevNum
      int primeIndex = binarySearch(primes, num - prevNum);
      if (primeIndex > 0) {
        num -= primes[primeIndex - 1];
      }
      if (num <= prevNum) {
        return false;
      }
      prevNum = num;
    }

    return true;
  }

  List<int> primeDetector(int n) {
    List<bool> isPrime = List.filled(n, true);
    isPrime[0] = false;
    isPrime[1] = false;

    for (int i = 2; i * i < n; i++) {
      if (isPrime[i]) {
        for (int j = i * i; j < n; j += i) {
          isPrime[j] = false;
        }
      }
    }

    List<int> primes = [];
    for (int i = 2; i < n; i++) {
      if (isPrime[i]) {
        primes.add(i);
      }
    }

    return primes;
  }

  int binarySearch(List<int> nums, int target) {
    int left = 0, right = nums.length - 1;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[mid] >= target) {
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    return left;
  }
}

void main() {
  Solution solution = new Solution();
  print(solution.primeSubOperation([4, 9, 6, 10])); // Expected Output: true
  print(solution.primeSubOperation([6, 8, 11, 12])); // Expected Output: true
  print(solution.primeSubOperation([5, 8, 3])); // Expected Output: false
}
