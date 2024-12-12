import 'dart:math';

class Solution {
  int pickGifts(List<int> gifts, int k) {
  gifts.sort((a, b) => b.compareTo(a));

  for (int i = 0; i < k; i++) {
    if (gifts.isEmpty) break;

    int maxPile = gifts.removeAt(0);

    int remaining = max(1, sqrt(maxPile).floor());

    gifts.add(remaining);
    gifts.sort((a, b) => b.compareTo(a));
  }

  return gifts.fold(0, (sum, pile) => sum + pile);
}
}



void main() {
  Solution solution = new Solution ();
  // test
  print(solution.pickGifts([25, 64, 9, 4, 100], 4)); // Output: 29
  print(solution.pickGifts([1, 1, 1, 1], 4)); // Output: 4
}
