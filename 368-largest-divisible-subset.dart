List<int> largestDivisibleSubset(List<int> nums) {
  if (nums.isEmpty) {
    return [];
  }

  nums.sort();

  int n = nums.length;
  List<int> dp = List<int>.filled(n, 1);
  List<int> prev = List<int>.filled(n, -1);

  int maxSize = 1;
  int maxIndex = 0;

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++) {
      if (nums[i] % nums[j] == 0 && dp[j] + 1 > dp[i]) {
        dp[i] = dp[j] + 1;
        prev[i] = j;
      }
    }
    if (dp[i] > maxSize) {
      maxSize = dp[i];
      maxIndex = i;
    }
  }

  // largest divisible subset.
  List<int> result = [];
  int currentIndex = maxIndex;
  while (currentIndex != -1) {
    result.add(nums[currentIndex]);
    currentIndex = prev[currentIndex];
  }

  return result.reversed.toList();
}

void main() {
  List<int> nums1 = [1, 2, 3];
  print("Input: $nums1");
  List<int> result1 = largestDivisibleSubset(nums1);
  print("Output: $result1");

  List<int> nums2 = [1, 2, 4, 8];
  print("\nInput: $nums2");
  List<int> result2 = largestDivisibleSubset(nums2);
  print("Output: $result2");
}
