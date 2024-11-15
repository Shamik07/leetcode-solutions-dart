class Solution {
    int minimizedMaximum(int n, List<int> quantities) {
      bool canDistribute(int maxLoad) {
        int requiredStores = 0;
        for (int quantity in quantities) {
          requiredStores += (quantity + maxLoad - 1) ~/ maxLoad; 
          if (requiredStores > n) return false; 
        }
        return true;
      }

      int left = 1;
      int right = quantities.reduce((a, b) => a > b ? a : b); 
      int result = right;

      while (left <= right) {
        int mid = left + (right - left) ~/ 2;
        if (canDistribute(mid)) {
          result = mid; // minimize further
          right = mid - 1;
        } else {
          left = mid + 1; // need a larger maximum load
        }
      }

      return result;
  }
}


void main() {
  Solution solution = new Solution();
  
  // Test cases
  int result1 = solution.minimizedMaximum(6, [11, 6]);
  print("Example 1: Expected output: 3, Actual output: $result1"); // Output: 3

  int result2 = solution.minimizedMaximum(7, [15, 10, 10]);
  print("Example 2: Expected output: 5, Actual output: $result2"); // Output: 5

  int result3 = solution.minimizedMaximum(1, [100000]);
  print("Example 3: Expected output: 100000, Actual output: $result3"); // Output: 100000
}
