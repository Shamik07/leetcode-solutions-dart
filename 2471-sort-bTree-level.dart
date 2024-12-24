import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val, [this.left, this.right]);
}

class Solution {
// sorting array
  int minSwaps(List<int> arr) {
    int n = arr.length;
    List<MapEntry<int, int>> indexedArray = [];
    for (int i = 0; i < n; i++) {
      indexedArray.add(MapEntry(arr[i], i));
    }

    indexedArray.sort((a, b) => a.key.compareTo(b.key));
    List<bool> visited = List.filled(n, false);
    int swaps = 0;

    for (int i = 0; i < n; i++) {
      if (visited[i] || indexedArray[i].value == i) continue;

      int cycleSize = 0;
      int j = i;

      while (!visited[j]) {
        visited[j] = true;
        j = indexedArray[j].value;
        cycleSize++;
      }

      if (cycleSize > 1) {
        swaps += cycleSize - 1;
      }
    }

    return swaps;
  }

  int minimumOperations(TreeNode? root) {
    if (root == null) return 0;

    Queue<TreeNode> queue = Queue<TreeNode>();
    queue.add(root);
    int totalSwaps = 0;

    while (queue.isNotEmpty) {
      int levelSize = queue.length;
      List<int> levelValues = [];

      for (int i = 0; i < levelSize; i++) {
        TreeNode? node = queue.removeFirst();
        //if (node == null) continue;

        levelValues.add(node.val);
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      totalSwaps += minSwaps(levelValues);
    }

    return totalSwaps;
  }
}

void main() {
  Solution solution = new Solution();

  TreeNode root1 = TreeNode(1, TreeNode(4, TreeNode(7), TreeNode(6)),
      TreeNode(3, TreeNode(8), TreeNode(5)));
  print(solution.minimumOperations(root1)); // Output: 3

  TreeNode root2 = TreeNode(1, TreeNode(3, TreeNode(7), TreeNode(6)),
      TreeNode(2, TreeNode(5), TreeNode(4)));
  print(solution.minimumOperations(root2)); // Output: 3

  TreeNode root3 = TreeNode(
      1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), null));
  print(solution.minimumOperations(root3)); // Output: 0
}
