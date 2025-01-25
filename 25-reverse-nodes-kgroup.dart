class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    if (head == null || k == 1) return head;

    ListNode dummy = ListNode(0, head);
    ListNode? groupPrev = dummy;

    while (head != null) {
      ListNode? tail = groupPrev?.next;
      ListNode? next = tail?.next;

      int count = 0;
      ListNode? current = head;
      while (current != null && count < k) {
        current = current.next;
        count++;
      }
      if (count < k) break;

      for (int i = 1; i < k; i++) {
        tail?.next = next?.next;
        next?.next = groupPrev?.next;
        groupPrev?.next = next;
        next = tail?.next;
      }

      groupPrev = tail;
      head = tail?.next;
    }

    return dummy.next;
  }
}

void main() {
  final solution = Solution();

  // Example 1: [1,2,3,4,5], k = 2
  final list1 = ListNode(1)
    ..next = ListNode(2)
    ..next?.next = ListNode(3)
    ..next?.next?.next = ListNode(4)
    ..next?.next?.next?.next = ListNode(5);

  final result1 = solution.reverseKGroup(list1, 2);
  printList(result1); // [2,1,4,3,5]

  // Example 2: [1,2,3,4,5], k = 3
  final list2 = ListNode(1)
    ..next = ListNode(2)
    ..next?.next = ListNode(3)
    ..next?.next?.next = ListNode(4)
    ..next?.next?.next?.next = ListNode(5);

  final result2 = solution.reverseKGroup(list2, 3);
  printList(result2); // [3,2,1,4,5]
}

void printList(ListNode? head) {
  final result = <int>[];
  while (head != null) {
    result.add(head.val);
    head = head.next;
  }
  print(result);
}
