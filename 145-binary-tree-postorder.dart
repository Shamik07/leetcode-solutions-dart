/**
 * Definition for a binary tree node.
 */
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    List<int> result = [];
    if (root == null) return result;

    List<TreeNode> stack1 = [];
    List<TreeNode> stack2 = [];

    stack1.add(root);

    while (stack1.isNotEmpty) {
      TreeNode node = stack1.removeLast();
      stack2.add(node);

      if (node.left != null) {
        stack1.add(node.left!);
      }
      if (node.right != null) {
        stack1.add(node.right!);
      }
    }

    while (stack2.isNotEmpty) {
      result.add(stack2.removeLast().val);
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();

  TreeNode? createTree(List<int?> values) {
    if (values.isEmpty || values[0] == null) return null;

    TreeNode root = TreeNode(values[0]!);
    List<TreeNode> queue = [root];
    int i = 1;

    while (queue.isNotEmpty && i < values.length) {
      TreeNode current = queue.removeAt(0);

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

  var tree1 = createTree([1, null, 2, 3]);
  print('Test 1: ${solution.postorderTraversal(tree1)}'); // [3,2,1]

  var tree2 = createTree([1]);
  print('Test 2: ${solution.postorderTraversal(tree2)}'); // [1]
}
