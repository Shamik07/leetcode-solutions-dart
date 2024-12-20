/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val, [this.left, this.right]);
}

class Solution {
  TreeNode? reverseOddLevels(TreeNode? root) {
    if (root == null) return null;

    void reverseLevel(List<TreeNode> nodes) {
      int start = 0, end = nodes.length - 1;
      while (start < end) {
        int temp = nodes[start].val;
        nodes[start].val = nodes[end].val;
        nodes[end].val = temp;
        start++;
        end--;
      }
    }

    List<TreeNode> currentNodes = [root];
    int level = 0;

    while (currentNodes.isNotEmpty) {
      List<TreeNode> nextLevel = [];

      for (TreeNode node in currentNodes) {
        if (node.left != null) nextLevel.add(node.left!);
        if (node.right != null) nextLevel.add(node.right!);
      }

      if (level % 2 == 1) {
        reverseLevel(currentNodes);
      }

      currentNodes = nextLevel;
      level++;
    }

    return root;
  }
}

TreeNode? createTree(List<int?> values) {
  if (values.isEmpty || values[0] == null) return null;

  TreeNode root = TreeNode(values[0]!);
  List<TreeNode> queue = [root];
  int index = 1;

  while (queue.isNotEmpty && index < values.length) {
    TreeNode node = queue.removeAt(0);

    if (index < values.length && values[index] != null) {
      node.left = TreeNode(values[index]!);
      queue.add(node.left!);
    }
    index++;

    if (index < values.length && values[index] != null) {
      node.right = TreeNode(values[index]!);
      queue.add(node.right!);
    }
    index++;
  }

  return root;
}

void printTree(TreeNode? root) {
  if (root == null) return;

  List<TreeNode> queue = [root];

  while (queue.isNotEmpty) {
    TreeNode node = queue.removeAt(0);
    print(node.val);

    if (node.left != null) queue.add(node.left!);
    if (node.right != null) queue.add(node.right!);
  }
}

void main() {
  Solution solution = new Solution();

  List<int?> values = [2, 3, 5, 8, 13, 21, 34];
  TreeNode? root = createTree(values);
  root = solution.reverseOddLevels(root);
  printTree(root); // Output: [2, 5, 3, 8, 13, 21, 34]

  List<int?> values1 = [7, 13, 11];
  TreeNode? root1 = createTree(values1);
  root1 = solution.reverseOddLevels(root1);
  printTree(root1); // Output: [7, 11, 13]

  List<int?> values2 = [0, 1, 2, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2];
  TreeNode? root2 = createTree(values2);
  root2 = solution.reverseOddLevels(root2);
  printTree(root2); // Output: [0, 2, 1, 0, 0, 0, 0, 2, 2, 2, 2, 1, 1, 1, 1]
}
