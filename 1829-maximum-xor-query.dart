List<int> getMaximumXor(List<int> nums, int maximumBit) {
  int n = nums.length;
  int maxNum = (1 << maximumBit) - 1; 
  int xorAll = 0;

  // Calculate XOR
  for (var num in nums) {
    xorAll ^= num;
  }

  List<int> answer = List.filled(n, 0);

  for (int i = 0; i < n; i++) {
    answer[i] = xorAll ^ maxNum;  
    xorAll ^= nums[n - i - 1];   
  }

  return answer;
}

void main() {
  print(getMaximumXor([0, 1, 1, 3], 2)); // Output: [0, 3, 2, 3]
  print(getMaximumXor([2, 3, 4, 7], 3)); // Output: [5, 2, 6, 5]
  print(getMaximumXor([0, 1, 2, 2, 5, 7], 3)); // Output: [4, 3, 6, 4, 6, 7]
}
