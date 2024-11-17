List<int> findPowerOfKSizeSubarrays(List<int> nums, int k) {
  List<int> results = [];
  for (int i = 0; i <= nums.length - k; i++) {
    List<int> subarray = nums.sublist(i, i + k);
    bool isValid = true;
    for (int j = 0; j < subarray.length - 1; j++) {
      if (subarray[j] + 1 != subarray[j + 1]) {
        isValid = false;
        break;
      }
    }

    results.add(isValid ? subarray.last : -1);
  }
  return results;
}

void main() {
  List<int> nums1 = [1, 2, 3, 4, 3, 2, 5];
  int k1 = 3;
  print(findPowerOfKSizeSubarrays(nums1, k1)); // [3, 4, -1, -1, -1]

  List<int> nums2 = [2, 2, 2, 2, 2];
  int k2 = 4;
  print(findPowerOfKSizeSubarrays(nums2, k2)); // [-1, -1]

  List<int> nums3 = [3, 2, 3, 2, 3, 2];
  int k3 = 2;
  print(findPowerOfKSizeSubarrays(nums3, k3)); // [-1, 3, -1, 3, -1]
}
