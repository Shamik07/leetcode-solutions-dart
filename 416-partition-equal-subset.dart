import 'dart:collection';

bool canPartition(List<int> nums) {
  int totalSum = nums.fold(0, (prev, element) => prev + element);

  // odd
  if (totalSum % 2 != 0) {
    return false;
  }

  int targetSum = totalSum ~/ 2;
  Set<int> reachableSums = {0};

  for (int num in nums) {
    Set<int> sumsToAdd = HashSet<int>();
    for (int sum in reachableSums) {
      int newSum = sum + num;
      if (newSum == targetSum) {
        return true; // reached.
      }
      if (newSum < targetSum) {
        sumsToAdd.add(newSum);
      }
    }
    reachableSums.addAll(sumsToAdd);
  }

  // unreachable.
  return false;
}

void main() {
  List<int> nums1 = [1, 5, 11, 5];
  bool result1 = canPartition(nums1);
  print("Input: $nums1, Can partition: $result1"); // Expected: true

  List<int> nums2 = [1, 2, 3, 5];
  bool result2 = canPartition(nums2);
  print("Input: $nums2, Can partition: $result2"); // Expected: false
}
