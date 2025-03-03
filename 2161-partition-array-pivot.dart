class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    List<int> less = [];
    List<int> equal = [];
    List<int> greater = [];

    for (int num in nums) {
      if (num < pivot) {
        less.add(num);
      } else if (num == pivot) {
        equal.add(num);
      } else {
        greater.add(num);
      }
    }

    less.addAll(equal);
    less.addAll(greater);

    return less;
  }
}

void main() {
  Solution solution = Solution();

  List<int> nums1 = [9, 12, 5, 10, 14, 3, 10];
  int pivot1 = 10;
  print(solution.pivotArray(nums1, pivot1)); // Output: [9,5,3,10,10,12,14]

  List<int> nums2 = [-3, 4, 3, 2];
  int pivot2 = 2;
  print(solution.pivotArray(nums2, pivot2)); // Output: [-3,2,4,3]
}
