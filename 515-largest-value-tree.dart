class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val, [this.left, this.right]);
}

class Solution {
  List<int> largestValues(TreeNode? root) {
    if (root == null) return [];

    List<int> result = [];
    List<TreeNode> queue = [root];

    while (queue.isNotEmpty) {
      int levelSize = queue.length;
      int maxVal = -0x80000000; // min integer

      for (int i = 0; i < levelSize; i++) {
        TreeNode current = queue.removeAt(0);
        maxVal = maxVal > current.val ? maxVal : current.val;

        if (current.left != null) queue.add(current.left!);
        if (current.right != null) queue.add(current.right!);
      }

      result.add(maxVal);
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();

  // Example 1: root = [1,3,2,5,3,null,9]
  TreeNode example1 = TreeNode(
    1,
    TreeNode(3, TreeNode(5), TreeNode(3)),
    TreeNode(2, null, TreeNode(9)),
  );

  print("Output:");
  print(solution.largestValues(example1)); // Output: [1,3,9]

  // Example 2: root = [1,2,3]
  TreeNode example2 = TreeNode(
    1,
    TreeNode(2),
    TreeNode(3),
  );

  print("\nOutput:");
  print(solution.largestValues(example2)); // Output: [1,3]
}
