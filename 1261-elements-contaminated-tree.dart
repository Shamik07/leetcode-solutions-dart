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
  TreeNode([this.val = 0, this.left, this.right]);
}

class FindElements {
  Set<int> _values = {};

  FindElements(TreeNode? root) {
    _recoverTree(root, 0);
  }

  void _recoverTree(TreeNode? node, int val) {
    if (node == null) return;

    node.val = val;
    _values.add(val);

    _recoverTree(node.left, 2 * val + 1);
    _recoverTree(node.right, 2 * val + 2);
  }

  bool find(int target) {
    return _values.contains(target);
  }
}

/**
 * Your FindElements object will be instantiated and called as such:
 * FindElements obj = FindElements(root);
 * bool param1 = obj.find(target);
 */

void main() {
  // Test Case 1
  TreeNode root1 = TreeNode(-1, TreeNode(-1), TreeNode(-1));
  FindElements findElements1 = FindElements(root1);
  print(findElements1.find(1)); // true
  print(findElements1.find(2)); // true
  print(findElements1.find(3)); // false

  // Test Case 2
  TreeNode root2 = TreeNode(-1, null, TreeNode(-1));
  FindElements findElements2 = FindElements(root2);
  print(findElements2.find(1)); // false
  print(findElements2.find(2)); // true

  // Test Case 3
  TreeNode root3 = TreeNode(-1, TreeNode(-1, TreeNode(-1), null), TreeNode(-1));
  FindElements findElements3 = FindElements(root3);
  print(findElements3.find(1)); // true
  print(findElements3.find(3)); // true
  print(findElements3.find(5)); // false
}
