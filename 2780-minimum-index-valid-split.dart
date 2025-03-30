int minimumIndex(List<int> nums) {
  int n = nums.length;

  int candidate = nums[0];
  int count = 1;

  for (int i = 1; i < n; i++) {
    if (count == 0) {
      candidate = nums[i];
      count = 1;
    } else if (nums[i] == candidate) {
      count++;
    } else {
      count--;
    }
  }

  int totalCount = nums.where((num) => num == candidate).length;

  int leftCount = 0;
  for (int i = 0; i < n - 1; i++) {
    if (nums[i] == candidate) leftCount++;

    int leftSize = i + 1;
    int rightSize = n - leftSize;

    if (leftCount * 2 > leftSize && (totalCount - leftCount) * 2 > rightSize) {
      return i;
    }
  }

  return -1;
}

void main() {
  print("Example 1: ${minimumIndex([1, 2, 2, 2])}");
  print("Example 2: ${minimumIndex([2, 1, 3, 1, 1, 1, 7, 1, 2, 1])}");
  print("Example 3: ${minimumIndex([3, 3, 3, 3, 7, 2, 2])}");
}
