class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    final result = <List<int>>[];
    candidates.sort();
    
    void backtrack(int start, int remain, List<int> current) {
      if (remain == 0) {
        result.add(List.from(current));
        return;
      }
      
      for (var i = start; i < candidates.length; i++) {
        if (i > start && candidates[i] == candidates[i - 1]) continue;
        if (candidates[i] > remain) break;
        
        current.add(candidates[i]);
        backtrack(i + 1, remain - candidates[i], current);
        current.removeLast();
      }
    }
    
    backtrack(0, target, []);
    return result;
  }
}

void main() {
  final solution = Solution();
  print(solution.combinationSum2([10,1,2,7,6,1,5], 8));  // [[1,1,6],[1,2,5],[1,7],[2,6]]
  print(solution.combinationSum2([2,5,2,1,2], 5));       // [[1,2,2],[5]]
  print(solution.combinationSum2([1], 1));               // [[1]]
}