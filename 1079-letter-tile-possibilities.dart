class Solution {
  int numTilePossibilities(String tiles) {
    Map<String, int> frequency = {};
    for (int i = 0; i < tiles.length; i++) {
      String char = tiles[i];
      frequency[char] = (frequency[char] ?? 0) + 1;
    }

    int result = 0;

    void backtrack() {
      for (var entry in frequency.entries) {
        String char = entry.key;
        int count = entry.value;

        if (count > 0) {
          result++;
          frequency[char] = count - 1;

          backtrack();

          frequency[char] = count;
        }
      }
    }

    backtrack();
    return result;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  print(solution.numTilePossibilities("AAB")); // 8

  // Test Case 2
  print(solution.numTilePossibilities("AAABBC")); // 188

  // Test Case 3
  print(solution.numTilePossibilities("V")); // 1
}
