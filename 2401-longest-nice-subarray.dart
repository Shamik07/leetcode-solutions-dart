int longestNiceSubarray(List<int> nums) {
  int maxLength = 0;
  int bitmask = 0;
  int left = 0;    

  for (int right = 0; right < nums.length; right++) {
    while ((bitmask & nums[right]) != 0) {
      bitmask ^= nums[left]; 
      left++;                
    }

    bitmask |= nums[right];

    maxLength = maxLength > (right - left + 1) ? maxLength : (right - left + 1);
  }

  return maxLength;
}

void main() {
  List<int> nums1 = [1, 3, 8, 48, 10];
  print("Input: $nums1");
  print("Output: ${longestNiceSubarray(nums1)}"); // Output: 3

  List<int> nums2 = [3, 1, 5, 11, 13];
  print("Input: $nums2");
  print("Output: ${longestNiceSubarray(nums2)}"); // Output: 1

  List<int> nums3 = [2, 4, 8, 16, 32];
  print("Input: $nums3");
  print("Output: ${longestNiceSubarray(nums3)}"); // Output: 5
}