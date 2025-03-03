class Solution {
  List<int> applyOperations(List<int> nums) {
    int n = nums.length;

    for (int i = 0; i < n - 1; i++) {
      if (nums[i] == nums[i + 1]) {
        nums[i] *= 2;
        nums[i + 1] = 0;
      }
    }

    List<int> result = [];
    int zeroCount = 0;

    for (int num in nums) {
      if (num != 0) {
        result.add(num);
      } else {
        zeroCount++;
      }
    }

    for (int i = 0; i < zeroCount; i++) {
      result.add(0);
    }

    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.applyOperations([1, 2, 2, 1, 1, 0])); // [1, 4, 2, 0, 0, 0]

  // Test Case 2
  print(solution.applyOperations([0, 1])); // [1, 0]

  // Test Case 3
  print(solution
      .applyOperations([5, 5, 5, 5, 0, 0, 0])); // [10, 10, 0, 0, 0, 0, 0]
}
