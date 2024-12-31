class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode(0);
    ListNode current = dummyHead;
    int carry = 0;

    while (l1 != null || l2 != null || carry != 0) {
      int sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry;
      carry = sum ~/ 10;
      current.next = ListNode(sum % 10); // remainder
      current = current.next!;

      l1 = l1?.next;
      l2 = l2?.next;
    }

    return dummyHead.next;
  }
}

ListNode? createLinkedList(List<int> values) {
  ListNode? head;
  ListNode? current;
  for (var value in values) {
    if (head == null) {
      head = ListNode(value);
      current = head;
    } else {
      current!.next = ListNode(value);
      current = current.next;
    }
  }
  return head;
}

void printLinkedList(ListNode? node) {
  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

void main() {
  Solution solution = new Solution();
  ListNode? l1 = createLinkedList([2, 4, 3]);
  ListNode? l2 = createLinkedList([5, 6, 4]);

  ListNode? result = solution.addTwoNumbers(l1, l2);
  printLinkedList(result); // Output: 7 -> 0 -> 8
}
