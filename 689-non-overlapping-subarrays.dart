class Solution {
  List<int> maxSumOfThreeSubarrays(List<int> nums, int k) {
    int n = nums.length;
    List<int> windowSums = List.filled(n - k + 1, 0);

    int windowSum = 0;
    for (int i = 0; i < n; i++) {
      windowSum += nums[i];
      if (i >= k - 1) {
        windowSums[i - k + 1] = windowSum;
        windowSum -= nums[i - k + 1];
      }
    }

    //  max index array
    List<int> left = List.filled(windowSums.length, 0);
    int maxIndex = 0;
    for (int i = 0; i < windowSums.length; i++) {
      if (windowSums[i] > windowSums[maxIndex]) {
        maxIndex = i;
      }
      left[i] = maxIndex;
    }

    List<int> right = List.filled(windowSums.length, 0);
    maxIndex = windowSums.length - 1;
    for (int i = windowSums.length - 1; i >= 0; i--) {
      if (windowSums[i] >= windowSums[maxIndex]) {
        maxIndex = i;
      }
      right[i] = maxIndex;
    }

    //maximum sum of three subarrays
    List<int> result = [-1, -1, -1];
    int maxSum = 0;
    for (int mid = k; mid < windowSums.length - k; mid++) {
      int l = left[mid - k];
      int r = right[mid + k];
      int total = windowSums[l] + windowSums[mid] + windowSums[r];
      if (total > maxSum) {
        maxSum = total;
        result = [l, mid, r];
      }
    }

    return result;
  }
}

void main() {
  Solution solution = new Solution();

  // Example 1
  List<int> nums1 = [1, 2, 1, 2, 6, 7, 5, 1];
  int k1 = 2;
  print('${solution.maxSumOfThreeSubarrays(nums1, k1)}');
  print('');

  // Example 2
  List<int> nums2 = [1, 2, 1, 2, 1, 2, 1, 2, 1];
  int k2 = 2;
  print('${solution.maxSumOfThreeSubarrays(nums2, k2)}');
}
