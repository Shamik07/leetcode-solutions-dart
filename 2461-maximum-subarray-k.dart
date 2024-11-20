int maximumSubarraySum(List<int> nums, int k) {
  int maxSum = 0;
  int currentSum = 0;
  Map<int, int> countMap = {};

  for (int i = 0; i < nums.length; i++) {
    currentSum += nums[i];
    countMap[nums[i]] = (countMap[nums[i]] ?? 0) + 1;

    if (i >= k) {
      int leftElement = nums[i - k];
      currentSum -= leftElement;
      countMap[leftElement] = countMap[leftElement]! - 1;
      if (countMap[leftElement] == 0) {
        countMap.remove(leftElement);
      }
    }

    if (countMap.length == k) {
      maxSum = maxSum < currentSum ? currentSum : maxSum;
    }
  }

  return maxSum;
}

void main() {
  print(maximumSubarraySum([1, 5, 4, 2, 9, 9, 9], 3)); // Output: 15
  print(maximumSubarraySum([4, 4, 4], 3)); // Output: 0
  print(maximumSubarraySum([9, 9, 9, 1, 2, 3], 3)); // Output: 12
}
