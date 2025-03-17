bool divideArray(List<int> nums) {
  Map<int, int> frequency = {};
  
  for (int num in nums) {
    frequency[num] = (frequency[num] ?? 0) + 1;
  }
  
  for (int count in frequency.values) {
    if (count % 2 != 0) {
      return false;
    }
  }
  
  return true;
}

void main() {
  print(divideArray([3, 2, 3, 2, 2, 2])); // Output: true
  print(divideArray([1, 2, 3, 4]));       // Output: false
}