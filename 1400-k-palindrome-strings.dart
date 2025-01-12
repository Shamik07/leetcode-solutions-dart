class Solution {
  bool canConstruct(String s, int k) {
    if (k > s.length) return false;
    if (k == s.length) return true;
    
    List<int> freq = List.filled(26, 0);
    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }
    
    int oddCount = 0;
    for (int count in freq) {
      if (count % 2 == 1) {
        oddCount++;
      }
    }
    return oddCount <= k;
  }
}

void main() {
  final solution = Solution();
  
  print('Test 1: ${solution.canConstruct("annabelle", 2)}'); // true
  print('Test 2: ${solution.canConstruct("leetcode", 3)}'); // false
  print('Test 3: ${solution.canConstruct("true", 4)}'); // true

}