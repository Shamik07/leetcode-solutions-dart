class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    ListNode dummy = ListNode(0); 
    ListNode current = dummy; 

    while (list1 != null && list2 != null) {
      if (list1.val <= list2.val) {
        current.next = list1;
        list1 = list1.next;
      } else {
        current.next = list2;
        list2 = list2.next;
      }
      current = current.next!;
    }

    current.next = list1 ?? list2;

    return dummy.next;
  }
}

void printList(ListNode? head) {
  while (head != null) {
    print(head.val);
    head = head.next;
  }
}

void main() {
  Solution sol = Solution();
  
  ListNode list1 = ListNode(1, ListNode(2, ListNode(4)));
  ListNode list2 = ListNode(1, ListNode(3, ListNode(4)));
  
  ListNode? mergedList = sol.mergeTwoLists(list1, list2);
  printList(mergedList); // Output: 1 -> 1 -> 2 -> 3 -> 4 -> 4
}
