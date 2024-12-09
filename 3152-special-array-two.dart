class Solution {

List<bool> isArraySpecial(List<int> nums, List<List<int>> queries) {
  int n = nums.length;
  
  // single element array
  if (n == 1) {
     return queries.map((query) => true).toList();
  }
 
  List<int> specialCheck = List.filled(n - 1, 0);
  for (int i = 0; i < n - 1; i++) {
    if ((nums[i] % 2) != (nums[i + 1] % 2)) {
      specialCheck[i] = 1;
    }
  }

  List<int> prefix = List.filled(n - 1, 0);
  prefix[0] = specialCheck[0];
  for (int i = 1; i < n - 1; i++) {
    prefix[i] = prefix[i - 1] + specialCheck[i];
  }

  List<bool> result = [];
  for (var query in queries) {
    int from = query[0];
    int to = query[1];

    if (to == from) {
      // no pairs
      result.add(true);
      continue;
    }

    int totalPairs = to - from;
    int totalSpecial = prefix[to - 1] - (from > 0 ? prefix[from - 1] : 0);
    result.add(totalPairs == totalSpecial);
  }

  return result;
}

}

void main() {
  Solution solution = Solution();

  List<int> nums = [3, 4, 1, 2, 6];
  List<List<int>> queries = [
    [0, 4]
  ];

  List<bool> result = solution.isArraySpecial(nums, queries);
  print(result); // Output: [false]

  nums = [4, 3, 1, 6];
  queries = [
    [0, 2],
    [2, 3]
  ];
  result = solution.isArraySpecial(nums, queries);
  print(result); // Output: [false, true]
  
  
  nums = [1];
  queries = [
    [0, 0]
  ];

  result = solution.isArraySpecial(nums, queries);
  print(result); // Output: [true]
}
