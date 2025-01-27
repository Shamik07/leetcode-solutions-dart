class Solution {
  List<bool> checkIfPrerequisite(
      int numCourses, List<List<int>> prerequisites, List<List<int>> queries) {
    List<List<bool>> graph =
        List.generate(numCourses, (_) => List.filled(numCourses, false));

    for (var prereq in prerequisites) {
      graph[prereq[0]][prereq[1]] = true;
    }

    for (int k = 0; k < numCourses; k++) {
      for (int i = 0; i < numCourses; i++) {
        for (int j = 0; j < numCourses; j++) {
          graph[i][j] = graph[i][j] || (graph[i][k] && graph[k][j]);
        }
      }
    }

    return queries.map((query) => graph[query[0]][query[1]]).toList();
  }
}

void main() {
  final solution = Solution();

  print(solution.checkIfPrerequisite(2, [
    [1, 0]
  ], [
    [0, 1],
    [1, 0]
  ])); // [false,true]

  print(solution.checkIfPrerequisite(2, [], [
    [1, 0],
    [0, 1]
  ])); // [false,false]

  print(solution.checkIfPrerequisite(3, [
    [1, 2],
    [1, 0],
    [2, 0]
  ], [
    [1, 0],
    [1, 2]
  ])); // [true,true]
}
