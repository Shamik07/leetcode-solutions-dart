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
  TreeNode? constructFromPrePost(List<int> preorder, List<int> postorder) {
    if (preorder.isEmpty || postorder.isEmpty) return null;

    TreeNode root = TreeNode(preorder[0]);

    if (preorder.length == 1) return root;

    int leftRootVal = preorder[1];

    int leftRootIndex = postorder.indexOf(leftRootVal);

    List<int> postLeft = postorder.sublist(0, leftRootIndex + 1);
    List<int> postRight =
        postorder.sublist(leftRootIndex + 1, postorder.length - 1);

    List<int> preLeft = preorder.sublist(1, 1 + postLeft.length);
    List<int> preRight = preorder.sublist(1 + postLeft.length);

    root.left = constructFromPrePost(preLeft, postLeft);
    root.right = constructFromPrePost(preRight, postRight);

    return root;
  }
}

void main() {
  final solution = Solution();

  // Test Case 1
  TreeNode? result1 = solution
      .constructFromPrePost([1, 2, 4, 5, 3, 6, 7], [4, 5, 2, 6, 7, 3, 1]);
  print(result1?.val); // 1

  // Test Case 2
  TreeNode? result2 = solution.constructFromPrePost([1], [1]);
  print(result2?.val); // 1

  // Test Case 3
  TreeNode? result3 = solution.constructFromPrePost([1, 2, 3], [3, 2, 1]);
  print(result3?.val); // 1
}
