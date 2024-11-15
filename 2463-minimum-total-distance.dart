import 'dart:math';

class Solution {
  int minimumTotalDistance(List<int> robots, List<List<int>> factories) {
    const MAX = 1 << 60;

    robots.sort();
    factories.sort((a, b) => a[0] - b[0]);

    List<int> prefix = [0];
    for (final f in factories) {
      prefix.add(prefix.last + f[1]);
    }

    final F = factories.length;
    final R = robots.length;
    var dp = List.generate(F + 1, (_) => List.filled(R + 1, MAX));
    dp[0][0] = 0;

    for (int i = 1; i <= F; i++) {
      for (int j = 0; j <= R; j++) {
        dp[i][j] = dp[i - 1][j];
        int cost = 0;
        for (int k = 1; k <= factories[i - 1][1] && j - k >= 0; k++) {
          cost += (robots[j - k] - factories[i - 1][0]).abs();
          dp[i][j] = min(dp[i][j], dp[i - 1][j - k] + cost);
        }
      }
    }

    return dp[F][R];
  }
}

void main() {
  // Test case
  List<int> robots = [
    670355988,
    403625544,
    886437985,
    224430896,
    126139936,
    -477101480,
    -868159607,
    -293937930
  ];
  List<List<int>> factories = [
    [333473422, 7],
    [912209329, 7],
    [468372740, 7],
    [-765827269, 4],
    [155827122, 4],
    [635462096, 2],
    [-300275936, 2],
    [-115627659, 0]
  ];
  print(Solution()
      .minimumTotalDistance(robots, factories)); // Expected output: 509199280
}
