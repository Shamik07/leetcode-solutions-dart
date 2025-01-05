class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    final dummy = ListNode(0, head);
    var slow = dummy;
    var fast = head;
    
    for (var i = 0; i < n; i++) {
      fast = fast?.next;
    }
    
    while (fast != null) {
      slow = slow.next!;
      fast = fast.next;
    }
    
    slow.next = slow.next?.next;
    return dummy.next;
  }
}

void main() {
  // Helper function to create linked list from array
  ListNode? createList(List<int> nums) {
    if (nums.isEmpty) return null;
    final head = ListNode(nums[0]);
    var current = head;
    for (var i = 1; i < nums.length; i++) {
      current.next = ListNode(nums[i]);
      current = current.next!;
    }
    return head;
  }

  // Helper function to convert list to array
  List<int> listToArray(ListNode? head) {
    final result = <int>[];
    var current = head;
    while (current != null) {
      result.add(current.val);
      current = current.next;
    }
    return result;
  }

  final solution = Solution();
  
  print(listToArray(solution.removeNthFromEnd(createList([1,2,3,4,5]), 2)));  // [1,2,3,5]
  print(listToArray(solution.removeNthFromEnd(createList([1]), 1)));          // []
  print(listToArray(solution.removeNthFromEnd(createList([1,2]), 1)));        // [1]
}