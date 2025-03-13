class Solution {
  int minZeroArray(List<int> nums, List<List<int>> queries) {
    bool allZero = true;
    for (int num in nums) {
      if (num > 0) {
        allZero = false;
        break;
      }
    }
    if (allZero) return 0;
    
    int left = 1;
    int right = queries.length;
    
    while (left <= right) {
      int mid = left + ((right - left) >> 1);
      
      if (canZeroArray(nums, queries, mid)) {
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    
    return left <= queries.length ? left : -1;
  }
  
  bool canZeroArray(List<int> nums, List<List<int>> queries, int k) {
    int n = nums.length;
    List<int> diff = List<int>.filled(n + 1, 0);
    
    for (int i = 0; i < k; i++) {
      int l = queries[i][0];
      int r = queries[i][1];
      int val = queries[i][2];
      
      diff[l] += val;
      diff[r + 1] -= val;
    }
    
    int current = 0;
    for (int i = 0; i < n; i++) {
      current += diff[i];
      if (nums[i] > current) {
        return false;
      }
    }
    
    return true;
  }
}

void main() {
  final solution = Solution();
  
  List<int> nums1 = [2, 0, 2];
  List<List<int>> queries1 = [[0, 2, 1], [0, 2, 1], [1, 1, 3]];
  print("Example 1: ${solution.minimumQueries(nums1, queries1)}");
  
  List<int> nums2 = [4, 3, 2, 1];
  List<List<int>> queries2 = [[1, 3, 2], [0, 2, 1]];
  print("Example 2: ${solution.minimumQueries(nums2, queries2)}");
  
  List<int> nums3 = List.generate(2000, (i) => i % 5 + 1);
  var queries3 = [[0, 500, 2], [500, 1000, 3], [1000, 1500, 4], [1500, 1999, 5], [0, 1999, 1]];
  print("Example 3: ${solution.minimumQueries(nums3, queries3)}");
}