class Solution {
  int firstCompleteIndex(List<int> arr, List<List<int>> mat) {
    final int m = mat.length;   
    final int n = mat[0].length; 
   
    final Map<int, List<int>> positions = {};
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        positions[mat[i][j]] = [i, j];
      }
    }
    
    final List<int> rowCount = List.filled(m, 0);
    final List<int> colCount = List.filled(n, 0);
    
    for (int i = 0; i < arr.length; i++) {
      final List<int> pos = positions[arr[i]]!;
      final int row = pos[0];
      final int col = pos[1];
      
      rowCount[row]++;
      colCount[col]++;
     
      if (rowCount[row] == n || colCount[col] == m) {
        return i;
      }
    }
    
    return arr.length - 1;
  }
}

void main() {
  final solution = Solution();
  
  final arr1 = [1, 3, 4, 2];
  final mat1 = [
    [1, 4],
    [2, 3]
  ];
  print('Test Case 1: ${solution.firstCompleteIndex(arr1, mat1)}'); // Expected: 2
  
  final arr2 = [2, 8, 7, 4, 1, 3, 5, 6, 9];
  final mat2 = [
    [3, 2, 5],
    [1, 4, 6],
    [8, 7, 9]
  ];
  print('Test Case 2: ${solution.firstCompleteIndex(arr2, mat2)}'); // Expected: 3
}