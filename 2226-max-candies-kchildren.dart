class Solution {
  int maximumCandies(List<int> candies, int k) {
    if (candies.fold<int>(0, (sum, candy) => sum + candy) < k) {
      return 0;
    }
    
    int left = 1;
    int right = candies.reduce((max, candy) => max > candy ? max : candy);
    
    while (left < right) {
      int mid = left + (right - left + 1) ~/ 2;
      
      if (canAllocate(candies, k, mid)) {
        left = mid;
      } else {
        right = mid - 1;
      }
    }
    
    return left;
  }
  
  bool canAllocate(List<int> candies, int k, int candiesPerChild) {
    int childrenServed = 0;
    
    for (int pile in candies) {
      childrenServed += pile ~/ candiesPerChild;
      
      if (childrenServed >= k) {
        return true;
      }
    }
    
    return false;
  }
}

void main() {
  final solution = Solution();
  
  final candies1 = [5, 8, 6];
  final k1 = 3;
  print('Example 1: ${solution.maximumCandies(candies1, k1)}'); // Expected output: 5
  
  final candies2 = [2, 5];
  final k2 = 11;
  print('Example 2: ${solution.maximumCandies(candies2, k2)}'); // Expected output: 0
  
  final candies3 = [4, 7, 5];
  final k3 = 4;
  print('Example 3: ${solution.maximumCandies(candies3, k3)}'); // Expected output: 3
}