int minimumRecolors(String blocks, int k) {
  if (blocks.length < k) return -1;
  if (k <= 0) return 0;

  int n = blocks.length;
  int minOperations = k;
  int currentWhites = 0;

  for (int i = 0; i < k; i++) {
    if (blocks[i] == 'W') {
      currentWhites++;
    }
  }

  minOperations = currentWhites;

  for (int i = k; i < n; i++) {
    if (blocks[i - k] == 'W') {
      currentWhites--;
    }

    if (blocks[i] == 'W') {
      currentWhites++;
    }

    minOperations =
        currentWhites < minOperations ? currentWhites : minOperations;
  }

  return minOperations;
}

void main() {
  // Example 1
  String blocks1 = "WBBWWBBWBW";
  int k1 = 7;
  int result1 = minimumRecolors(blocks1, k1);
  print('Input: blocks = "$blocks1", k = $k1');
  print('Output: $result1');
  print('');

  // Example 2
  String blocks2 = "WBWBBBW";
  int k2 = 2;
  int result2 = minimumRecolors(blocks2, k2);
  print('Input: blocks = "$blocks2", k = $k2');
  print('Output: $result2');
}
