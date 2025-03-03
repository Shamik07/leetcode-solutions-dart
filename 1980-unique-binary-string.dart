class Solution {
  String findDifferentBinaryString(List<String> nums) {
    int n = nums.length;
    StringBuffer result = StringBuffer();

    for (int i = 0; i < n; i++) {
      result.write(nums[i][i] == '0' ? '1' : '0');
    }

    return result.toString();
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.findDifferentBinaryString(["01", "10"])); // "11"

  // Test Case 2
  print(solution.findDifferentBinaryString(["00", "01"])); // "10"

  // Test Case 3
  print(solution.findDifferentBinaryString(["111", "011", "001"])); // "100"
}
