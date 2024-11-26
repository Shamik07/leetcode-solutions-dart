import 'dart:collection';

class Solution {
  int slidingPuzzle(List<List<int>> board) {
    final dirs = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ];
    const m = 2;
    const n = 3;
    const goal = "123450";
    final StringBuffer startSb = StringBuffer();

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        startSb.write(board[i][j]);
      }
    }

    final start = startSb.toString();
    if (start == goal) return 0;

    final Queue<String> q = Queue<String>()..add(start);
    final Set<String> seen = {start};

    int step = 0;
    while (q.isNotEmpty) {
      step++;
      for (int sz = q.length; sz > 0; sz--) {
        final s = q.removeFirst();
        final zeroIndex = s.indexOf('0');
        final int i = zeroIndex ~/ n;
        final int j = zeroIndex % n;
        for (final dir in dirs) {
          final x = i + dir[0];
          final y = j + dir[1];
          if (x < 0 || x >= m || y < 0 || y >= n) continue;
          final swappedIndex = x * n + y;
          final sb = StringBuffer(s);
          sb.write(s[swappedIndex]);
          sb.write(s[zeroIndex]);
          final t = sb
              .toString()
              .replaceRange(swappedIndex, swappedIndex + 1, s[zeroIndex])
              .replaceRange(zeroIndex, zeroIndex + 1, s[swappedIndex]);
          if (t == goal) return step;
          if (!seen.contains(t)) {
            q.add(t);
            seen.add(t);
          }
        }
      }
    }

    return -1;
  }
}

void main() {
  final solution = Solution();
  final board = [
    [1, 2, 3],
    [4, 0, 5]
  ];
  print(solution.slidingPuzzle(
      board)); // Output: Expected number of steps or -1 if unsolvable
}
