class Solution {
  bool checkValidGrid(int n, List<List<int>> rectangles) {
    // horizontal
    List<List<int>> horizontalRects = List.from(rectangles);
    horizontalRects.sort((a, b) {
      if (a[0] != b[0]) return a[0].compareTo(b[0]);
      return b[2].compareTo(a[2]);
    });

    int count = 0;
    int lastEnd = horizontalRects[0][2];
    for (int i = 1; i < horizontalRects.length; i++) {
      if (lastEnd <= horizontalRects[i][0]) {
        count++;
      }
      lastEnd =
          lastEnd > horizontalRects[i][2] ? lastEnd : horizontalRects[i][2];
    }
    if (count >= 2) return true;

    // vertical
    List<List<int>> verticalRects = List.from(rectangles);
    verticalRects.sort((a, b) {
      if (a[1] != b[1]) return a[1].compareTo(b[1]);
      return b[3].compareTo(a[3]);
    });

    count = 0;
    lastEnd = verticalRects[0][3];
    for (int i = 1; i < verticalRects.length; i++) {
      if (lastEnd <= verticalRects[i][1]) {
        count++;
      }
      lastEnd = lastEnd > verticalRects[i][3] ? lastEnd : verticalRects[i][3];
    }

    return count >= 2;
  }
}

void main() {
  final solution = Solution();

  final example1 = [
    [1, 0, 5, 2],
    [0, 2, 2, 4],
    [3, 2, 5, 3],
    [0, 4, 4, 5]
  ];
  print("Example 1: ${solution.checkValidGrid(5, example1)}");

  final example2 = [
    [0, 0, 1, 1],
    [2, 0, 3, 4],
    [0, 2, 2, 3],
    [3, 0, 4, 3]
  ];
  print("Example 2: ${solution.checkValidGrid(4, example2)}");

  final example3 = [
    [0, 2, 2, 4],
    [1, 0, 3, 2],
    [2, 2, 3, 4],
    [3, 0, 4, 2],
    [3, 2, 4, 4]
  ];
  print("Example 3: ${solution.checkValidGrid(4, example3)}");
}
