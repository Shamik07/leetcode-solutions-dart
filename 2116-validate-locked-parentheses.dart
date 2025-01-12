class Solution {
  bool canBeValid(String s, String locked) {
    if (s.length % 2 != 0) return false;
    
    int balance = 0;
    int wild = 0;
    
    for (int i = 0; i < s.length; i++) {
      if (locked[i] == '1') {
        balance += s[i] == '(' ? 1 : -1;
      } else {
        wild++;
      }
      
      if (balance + wild < 0) return false;
    }
    
    balance = 0;
    wild = 0;
    
    for (int i = s.length - 1; i >= 0; i--) {
      if (locked[i] == '1') {
        balance += s[i] == ')' ? 1 : -1;
      } else {
        wild++;
      }
      
      if (balance + wild < 0) return false;
    }
    
    return true;
  }
}

void main() {
  final solution = Solution();
  
  print(solution.canBeValid("))()))", "010100")); // true
  print(solution.canBeValid("()()", "0000")); // true
  print(solution.canBeValid(")", "0")); // false
}