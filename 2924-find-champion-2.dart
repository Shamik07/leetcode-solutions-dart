class Solution {
  int findChampion(int n, List<List<int>> edges) {
    int ans = -1;
    int count = 0;
    List<int> inDegrees = List.filled(n, 0);

    for (List<int> edge in edges) {
      final int v = edge[1];
      inDegrees[v]++;
    }

    for (int i = 0; i < n; ++i) {
      if (inDegrees[i] == 0) {
        count++;
        ans = i;
      }
    }

    return count > 1 ? -1 : ans;
  }
}

void main() {
  Solution solution = Solution();
  
  int n = 3;
  List<List<int>> edges = [[0,1],[1,2]];
  
  print(solution.findChampion(n, edges)); // 0
  
  
  int n1 = 4; 
  List<List<int>> edges1 = [[0,2],[1,3],[1,2]];
  
  print(solution.findChampion(n1, edges1)); // -1
}
