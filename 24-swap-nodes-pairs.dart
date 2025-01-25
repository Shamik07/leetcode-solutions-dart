class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) {
      return head;
    }

    ListNode? first = head;
    ListNode? second = head.next;

    first.next = swapPairs(second!.next);
    second.next = first;

    return second;
  }
}

ListNode? createLinkedList(List<int> values) {
  if (values.isEmpty) return null;

  ListNode head = ListNode(values[0]);
  ListNode current = head;

  for (int i = 1; i < values.length; i++) {
    current.next = ListNode(values[i]);
    current = current.next!;
  }

  return head;
}

List<int> linkedListToArray(ListNode? head) {
  List<int> result = [];
  ListNode? current = head;

  while (current != null) {
    result.add(current.val);
    current = current.next;
  }

  return result;
}

// Test cases
void main() {
  final solution = Solution();

  var list1 = createLinkedList([1, 2, 3, 4]);
  print('Test case 1: ${linkedListToArray(solution.swapPairs(list1))}');
  // Expected: [2,1,4,3]

  var list2 = createLinkedList([]);
  print('Test case 2: ${linkedListToArray(solution.swapPairs(list2))}');
  // Expected: []

  var list3 = createLinkedList([1]);
  print('Test case 3: ${linkedListToArray(solution.swapPairs(list3))}');
  // Expected: [1]
}
