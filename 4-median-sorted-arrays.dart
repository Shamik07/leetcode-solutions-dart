class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    if (nums1.length > nums2.length) {
      return findMedianSortedArrays(nums2, nums1);
    }

    int x = nums1.length;
    int y = nums2.length;
    int low = 0, high = x;

    while (low <= high) {
      int partitionX = (low + high) ~/ 2;
      int partitionY = (x + y + 1) ~/ 2 - partitionX;

      int? maxLeftX = (partitionX == 0) ? null : nums1[partitionX - 1];
      int? minRightX = (partitionX == x) ? null : nums1[partitionX];

      int? maxLeftY = (partitionY == 0) ? null : nums2[partitionY - 1];
      int? minRightY = (partitionY == y) ? null : nums2[partitionY];

      if ((maxLeftX == null || minRightY == null || maxLeftX <= minRightY) &&
          (maxLeftY == null || minRightX == null || maxLeftY <= minRightX)) {
        if ((x + y) % 2 == 0) {
          return ([
                    if (maxLeftX != null) maxLeftX,
                    if (maxLeftY != null) maxLeftY
                  ].reduce((a, b) => a > b ? a : b) +
                  [
                    if (minRightX != null) minRightX,
                    if (minRightY != null) minRightY
                  ].reduce((a, b) => a < b ? a : b)) /
              2;
        } else {
          return [
            if (maxLeftX != null) maxLeftX,
            if (maxLeftY != null) maxLeftY
          ].reduce((a, b) => a > b ? a : b).toDouble();
        }
      } else if (maxLeftX != null &&
          minRightY != null &&
          maxLeftX > minRightY) {
        high = partitionX - 1; // left
      } else {
        low = partitionX + 1; // right
      }
    }

    throw ArgumentError('Input arrays are not sorted.');
  }
}

// Example Usage
void main() {
  Solution solution = new Solution();
  print(solution.findMedianSortedArrays([1, 3], [2])); // Output: 2.0
  print(solution.findMedianSortedArrays([1, 2], [3, 4])); // Output: 2.5
}
