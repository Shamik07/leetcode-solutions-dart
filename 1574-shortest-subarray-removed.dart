import 'dart:math';

int findLengthOfShortestSubarray(List<int> arr) {
  int n = arr.length;

  // Step 1: Find the longest non-decreasing prefix
  int left = 0;
  while (left < n - 1 && arr[left] <= arr[left + 1]) {
    left++;
  }

  // If the entire array is sorted, return 0
  if (left == n - 1) return 0;

  // Step 2: Find the longest non-decreasing suffix
  int right = n - 1;
  while (right > 0 && arr[right - 1] <= arr[right]) {
    right--;
  }

  // Step 3: Calculate the minimum subarray to remove
  int minToRemove = min(
      n - left - 1, right); // Remove all after the prefix or before the suffix

  // Step 4: Try merging the prefix and suffix
  int i = 0, j = right;
  while (i <= left && j < n) {
    if (arr[i] <= arr[j]) {
      minToRemove = min(minToRemove, j - i - 1);
      i++;
    } else {
      j++;
    }
  }

  return minToRemove;
}

void main() {
  List<int> arr1 = [1, 2, 3, 10, 4, 2, 3, 5];
  print(findLengthOfShortestSubarray(arr1)); // Output: 3

  List<int> arr2 = [5, 4, 3, 2, 1];
  print(findLengthOfShortestSubarray(arr2)); // Output: 4

  List<int> arr3 = [1, 2, 3];
  print(findLengthOfShortestSubarray(arr3)); // Output: 0
}
