class Solution {
  List<int> findThePrefixCommonArray(List<int> A, List<int> B) {
    int n = A.length;
    List<int> result = List.filled(n, 0);
    Set<int> setA = {};
    Set<int> setB = {};

    for (int i = 0; i < n; i++) {
      setA.add(A[i]);
      setB.add(B[i]);

      int commonCount = 0;
      for (int num in setA) {
        if (setB.contains(num)) {
          commonCount++;
        }
      }

      result[i] = commonCount;
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  final A1 = [1, 3, 2, 4];
  final B1 = [3, 1, 2, 4];
  print('Test 1: ${solution.findThePrefixCommonArray(A1, B1)}'); // [0,2,3,4]

  final A2 = [2, 3, 1];
  final B2 = [3, 1, 2];
  print('Test 2: ${solution.findThePrefixCommonArray(A2, B2)}'); // [0,1,3]

  final A3 = [1, 2, 3, 4];
  final B3 = [4, 3, 2, 1];
  print('Test 3: ${solution.findThePrefixCommonArray(A3, B3)}'); // [0,0,0,4]
}
