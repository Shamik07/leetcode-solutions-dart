class Solution {
  double myPow(double x, int n) {
    if (n == 0) return 1.0;
    
    if (n < 0) {
      x = 1 / x;
      n = -n;
    }
    
    double result = 1.0;
    while (n > 0) {
      if (n % 2 == 1) {
        result *= x; 
      }
      x *= x; 
      n ~/= 2; 
    }
    
    return result;
  }
}

// Example Usage
void main() {
  Solution solution = Solution();
  
  // Example 1
  print(solution.myPow(2.00000, 10)); // Output: 1024.00000
  
  // Example 2
  print(solution.myPow(2.10000, 3)); // Output: 9.26100
  
  // Example 3
  print(solution.myPow(2.00000, -2)); // Output: 0.25000
  
  // Example 4
  print(solution.myPow(0.0, 5)); // Output: 0.0
  
  // Example 5
  print(solution.myPow(1.00000, 1000000)); // Output: 1.0
}
