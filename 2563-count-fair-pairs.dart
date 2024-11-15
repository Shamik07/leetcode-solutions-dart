int countFairPairs(List<int> nums, int lower, int upper) {
  nums.sort();

  int n = nums.length;
  int count = 0;

  for (int i = 0; i < n - 1; i++) {
    int left = i + 1;
    int right = n - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[i] + nums[mid] >= lower) {
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }

    int lowIndex = left;

    left = i + 1;
    right = n - 1;
    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[i] + nums[mid] <= upper) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    int highIndex = right;

    if (lowIndex <= highIndex) {
      count += (highIndex - lowIndex + 1);
    }
  }

  return count;
}

void main() {
  List<int> nums1 = [0, 1, 7, 4, 4, 5];
  int lower1 = 3;
  int upper1 = 6;
  print(countFairPairs(nums1, lower1, upper1)); // Output: 6

  List<int> nums2 = [1, 7, 9, 2, 5];
  int lower2 = 11;
  int upper2 = 11;
  print(countFairPairs(nums2, lower2, upper2)); // Output: 1
}
