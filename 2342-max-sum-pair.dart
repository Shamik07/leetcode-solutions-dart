class Solution {
  int maximumSum(List<int> nums) {
    int sumOfDigits(int num) {
      int sum = 0;
      while (num > 0) {
        sum += num % 10;
        num ~/= 10;
      }
      return sum;
    }

    Map<int, List<int>> digitSumMap = {};

    for (int num in nums) {
      int sum = sumOfDigits(num);
      digitSumMap.putIfAbsent(sum, () => []).add(num);
    }

    int maxSum = -1;

    for (var entry in digitSumMap.entries) {
      List<int> numbers = entry.value;
      if (numbers.length >= 2) {
        numbers.sort((a, b) => b.compareTo(a));
        int currentSum = numbers[0] + numbers[1];
        if (currentSum > maxSum) {
          maxSum = currentSum;
        }
      }
    }

    return maxSum;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.maximumSum([18, 43, 36, 13, 7])); // 54

  // Test Case 2
  print(solution.maximumSum([10, 12, 19, 14])); // -1

  // Test Case 3
  print(solution.maximumSum([229, 398, 269, 317, 420, 464, 491])); // 868
}
