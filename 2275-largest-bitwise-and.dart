int largestCombination(List<int> candidates) {
  // count how many numbers have a `1` at each bit position.
  List<int> bitCounts = List.filled(32, 0);
  
  for (int num in candidates) {
    for (int i = 0; i < 32; i++) {
      if ((num & (1 << i)) != 0) {
        bitCounts[i]++;
      }
    }
  }
  
  return bitCounts.reduce((a, b) => a > b ? a : b);
}

void main() {
  List<int> candidates1 = [16, 17, 71, 62, 12, 24, 14];
  print(largestCombination(candidates1)); // Output: 4
  
  List<int> candidates2 = [8, 8];
  print(largestCombination(candidates2)); // Output: 2
}
