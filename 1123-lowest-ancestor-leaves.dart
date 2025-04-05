import 'dart:collection';
import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
    return 'TreeNode{val: $val}';
  }
}

class LcaResult {
  int depth;
  TreeNode? lca;
  LcaResult(this.depth, this.lca);
}

class Solution {
  LcaResult _dfs(TreeNode? node) {
    if (node == null) {
      return LcaResult(-1, null);
    }

    LcaResult leftResult = _dfs(node.left);
    LcaResult rightResult = _dfs(node.right);

    int currentDepth = max(leftResult.depth, rightResult.depth) + 1;

    if (leftResult.depth > rightResult.depth) {
      return LcaResult(currentDepth, leftResult.lca);
    } else if (rightResult.depth > leftResult.depth) {
      return LcaResult(currentDepth, rightResult.lca);
    } else {
      // equal
      return LcaResult(currentDepth, node);
    }
  }

  TreeNode? lcaDeepestLeaves(TreeNode? root) {
    if (root == null) {
      return null;
    }
    LcaResult result = _dfs(root);
    return result.lca;
  }
}

TreeNode? buildTree(List<int?> values) {
  if (values.isEmpty || values[0] == null) {
    return null;
  }

  TreeNode root = TreeNode(values[0]!);
  Queue<TreeNode> queue = Queue<TreeNode>();
  queue.add(root);
  int i = 1;

  while (queue.isNotEmpty && i < values.length) {
    TreeNode current = queue.removeFirst();

    if (i < values.length && values[i] != null) {
      current.left = TreeNode(values[i]!);
      queue.add(current.left!);
    }
    i++;

    if (i < values.length && values[i] != null) {
      current.right = TreeNode(values[i]!);
      queue.add(current.right!);
    }
    i++;
  }
  return root;
}

void main() {
  final solution = Solution();

  List<int?> values1 = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4];
  TreeNode? root1 = buildTree(values1);
  TreeNode? lca1 = solution.lcaDeepestLeaves(root1);
  print("Example 1 LCA: ${lca1?.val}"); // Expected output: 2

  List<int?> values2 = [1];
  TreeNode? root2 = buildTree(values2);
  TreeNode? lca2 = solution.lcaDeepestLeaves(root2);
  print("Example 2 LCA: ${lca2?.val}"); // Expected output: 1
}
