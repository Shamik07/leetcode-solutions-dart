class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    if (arr.isEmpty) return [];
    
    // copy
    List<int> sortedArr = List.from(arr)..sort();
    
    //store 
    Map<int, int> rankMap = {};
    int rank = 1;
    
    for (int num in sortedArr) {
      if (!rankMap.containsKey(num)) {
        rankMap[num] = rank;
        rank++;
      }
    }
    
    // Transform
    return arr.map((num) => rankMap[num]!).toList();
  }
}

void main() {
  Solution solution = Solution();

  // Test cases
  List<int> arr1 = [40, 10, 20, 30];
  print(solution.arrayRankTransform(arr1)); // Output: [4, 1, 2, 3]

  List<int> arr2 = [100, 100, 100];
  print(solution.arrayRankTransform(arr2)); // Output: [1, 1, 1]

  List<int> arr3 = [37, 12, 28, 9, 100, 56, 80, 5, 12];
  print(solution.arrayRankTransform(arr3)); // Output: [5, 3, 4, 2, 8, 6, 7, 1, 3]

  List<int> arr4 = [];
  print(solution.arrayRankTransform(arr4)); // Output: []

  List<int> arr5 = [-10, -20, -30, -20, -10];
  print(solution.arrayRankTransform(arr5)); // Output: [3, 2, 1, 2, 3]
}
