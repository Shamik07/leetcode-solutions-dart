int putMarbles(List<int> weights, int k) {
  if (k == weights.length || k == 1) {
    return 0;
  }

  final n = weights.length;

  List<int> pairSums = List<int>.filled(n - 1, 0);
  for (int i = 0; i < n - 1; i++) {
    pairSums[i] = weights[i] + weights[i + 1];
  }

  pairSums.sort();

  int diff = 0;
  for (int i = 0; i < k - 1; i++) {
    diff += pairSums[n - 2 - i] - pairSums[i];
  }

  return diff;
}

void main() {
  List<int> weights1 = [1, 3, 5, 1];
  int k1 = 2;

  print('Example 1:');
  print('Input: weights = $weights1, k = $k1');
  int result1 = putMarbles(weights1, k1);
  print('Output: $result1');

  List<int> weights2 = [1, 3];
  int k2 = 2;

  print('Example 2:');
  print('Input: weights = $weights2, k = $k2');
  int result2 = putMarbles(weights2, k2);
  print('Output: $result2');
}
