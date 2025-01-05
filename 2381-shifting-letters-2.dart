class Solution {
  String shiftingLetters(String s, List<List<int>> shifts) {
    final n = s.length;
    final diff = List<int>.filled(n + 1, 0);
    
    for (final shift in shifts) {
      final start = shift[0];
      final end = shift[1];
      final direction = shift[2] == 1 ? 1 : -1;
      
      diff[start] += direction;
      diff[end + 1] -= direction;
    }
    
    var prefixSum = 0;
    final result = List<String>.filled(n, '');
    
    for (var i = 0; i < n; i++) {
      prefixSum += diff[i];
      
      var charValue = s.codeUnitAt(i) - 'a'.codeUnitAt(0);

      var newValue = (((charValue + prefixSum) % 26) + 26) % 26;

      result[i] = String.fromCharCode(newValue + 'a'.codeUnitAt(0));
    }
    
    return result.join();
  }
}

void main() {
  final solution = Solution();
  
  print(solution.shiftingLetters(
    "abc",
    [[0,1,0], [1,2,1], [0,2,1]]
  )); // Expected: "ace"
  
  print(solution.shiftingLetters(
    "dztz",
    [[0,0,0], [1,1,1]]
  )); // Expected: "catz"
  
  print(solution.shiftingLetters(
    "aaa",
    [[0,0,0], [1,1,1], [2,2,0]]
  )); // zbz
  
  print(solution.shiftingLetters(
    "abc",
    [[0,2,1], [0,2,1], [0,2,1]]
  )); // def
}