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

class Solution {
  TreeNode? recoverFromPreorder(String traversal) {
    if (traversal.isEmpty) return null;

    List<TreeNode> stack = [];
    int index = 0;

    while (index < traversal.length) {
      int depth = 0;
      while (index < traversal.length && traversal[index] == '-') {
        depth++;
        index++;
      }

      int value = 0;
      while (index < traversal.length && traversal[index] != '-') {
        value =
            value * 10 + (traversal[index].codeUnitAt(0) - '0'.codeUnitAt(0));
        index++;
      }

      TreeNode currentNode = TreeNode(value);

      if (depth == 0) {
        stack.add(currentNode);
        continue;
      }

      while (stack.length > depth) {
        stack.removeLast();
      }

      TreeNode parent = stack.last;
      if (parent.left == null) {
        parent.left = currentNode;
      } else {
        parent.right = currentNode;
      }

      stack.add(currentNode);
    }

    return stack.first;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  TreeNode? result1 = solution.recoverFromPreorder("1-2--3--4-5--6--7");
  print(result1?.val); // 1

  // Test Case 2
  TreeNode? result2 = solution.recoverFromPreorder("1-2--3---4-5--6---7");
  print(result2?.val); // 1

  // Test Case 3
  TreeNode? result3 = solution.recoverFromPreorder("1-401--349---90--88");
  print(result3?.val); // 1
}
