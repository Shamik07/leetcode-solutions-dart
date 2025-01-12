class Solution {
  bool lemonadeChange(List<int> bills) {
    int five = 0;
    int ten = 0;

    for (int bill in bills) {
      if (bill == 5) {
        five++;
      } else if (bill == 10) {
        if (five == 0) return false;
        five--;
        ten++;
      } else {
        // bill == 20
        if (ten > 0 && five > 0) {
          ten--;
          five--;
        } else if (five >= 3) {
          five -= 3;
        } else {
          return false;
        }
      }
    }

    return true;
  }
}

void main() {
  final solution = Solution();

  final bills1 = [5, 5, 5, 10, 20];
  print('Example 1: ${solution.lemonadeChange(bills1)}'); // Output: true

  final bills2 = [5, 5, 10, 10, 20];
  print('Example 2: ${solution.lemonadeChange(bills2)}'); // Output: false
}
