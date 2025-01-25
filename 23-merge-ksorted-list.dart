class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;

    return mergeLists(lists, 0, lists.length - 1);
  }

  ListNode? mergeLists(List<ListNode?> lists, int start, int end) {
    if (start == end) return lists[start];
    if (start + 1 == end) return mergeTwoLists(lists[start], lists[end]);

    int mid = (start + end) ~/ 2;
    ListNode? left = mergeLists(lists, start, mid);
    ListNode? right = mergeLists(lists, mid + 1, end);
    return mergeTwoLists(left, right);
  }

  ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {
    if (l1 == null) return l2;
    if (l2 == null) return l1;

    ListNode dummy = ListNode();
    ListNode current = dummy;

    while (l1 != null && l2 != null) {
      if (l1.val <= l2.val) {
        current.next = l1;
        l1 = l1.next;
      } else {
        current.next = l2;
        l2 = l2.next;
      }
      current = current.next!;
    }

    current.next = l1 ?? l2;
    return dummy.next;
  }
}

// Test cases
void main() {
  final solution = Solution();

  // Example 1: [[1,4,5],[1,3,4],[2,6]]
  final list1 = ListNode(1)
    ..next = ListNode(4)
    ..next?.next = ListNode(5);
  final list2 = ListNode(1)
    ..next = ListNode(3)
    ..next?.next = ListNode(4);
  final list3 = ListNode(2)..next = ListNode(6);

  final result1 = solution.mergeKLists([list1, list2, list3]);
  printList(result1); // [1,1,2,3,4,4,5,6]

  // Example 2: []
  final result2 = solution.mergeKLists([]);
  printList(result2); // []

  // Example 3: [[]]
  final result3 = solution.mergeKLists([null]);
  printList(result3); // []
}

void printList(ListNode? head) {
  final result = <int>[];
  while (head != null) {
    result.add(head.val);
    head = head.next;
  }
  print(result);
}
