class Solution {
  List<int> leftmostBuildingQueries(
      List<int> heights, List<List<int>> queries) {
    List<IndexedQuery> indexedQueries = getIndexedQueries(queries);
    List<int> ans = List.filled(queries.length, -1);
    List<int> stack = [];

    int heightsIndex = heights.length - 1;

    for (var indexedQuery in indexedQueries) {
      int queryIndex = indexedQuery.queryIndex;
      int a = indexedQuery.a;
      int b = indexedQuery.b;

      if (a == b || heights[a] < heights[b]) {
        // same building
        ans[queryIndex] = b;
      } else {
        // directly jump to Bob
        // stack
        while (heightsIndex > b) {
          while (stack.isNotEmpty &&
              heights[stack.last] <= heights[heightsIndex]) {
            stack.removeLast();
          }
          stack.add(heightsIndex--);
        }

        //  binary search
        int meetingIndex = lastGreater(stack, a, heights);
        if (meetingIndex != -1) {
          ans[queryIndex] = stack[meetingIndex];
        }
      }
    }

    return ans;
  }

  List<IndexedQuery> getIndexedQueries(List<List<int>> queries) {
    List<IndexedQuery> indexedQueries = [];
    for (int i = 0; i < queries.length; i++) {
      int a = queries[i][0];
      int b = queries[i][1];
      indexedQueries.add(IndexedQuery(i, a < b ? a : b, a < b ? b : a));
    }
    indexedQueries.sort((x, y) => y.b.compareTo(x.b)); // Sort descending by `b`
    return indexedQueries;
  }

  int lastGreater(List<int> stack, int target, List<int> heights) {
    int l = -1;
    int r = stack.length - 1;
    while (l < r) {
      int m = (l + r + 1) ~/ 2;
      if (heights[stack[m]] > heights[target]) {
        l = m;
      } else {
        r = m - 1;
      }
    }
    return l;
  }
}

class IndexedQuery {
  final int queryIndex;
  final int a;
  final int b;
  IndexedQuery(this.queryIndex, this.a, this.b);
}

void main() {
  Solution solution = Solution();
  List<int> heights = [5, 3, 8, 2, 6, 1, 4, 6];
  List<List<int>> queries = [
    [0, 7],
    [3, 5],
    [5, 2],
    [3, 0],
    [1, 6]
  ];

  print(solution.leftmostBuildingQueries(
      heights, queries)); // Output: [7, 6, -1, 4, 6]

  List<int> heights2 = [6, 4, 8, 5, 2, 7];
  List<List<int>> queries2 = [
    [0, 1],
    [0, 3],
    [2, 4],
    [3, 4],
    [2, 2]
  ];
  //Output: [2,5,-1,5,2]
  print(solution.leftmostBuildingQueries(heights2, queries2));
}
