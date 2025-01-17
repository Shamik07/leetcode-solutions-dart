class Solution {
  bool doesValidArrayExist(List<int> derived) {
    int n = derived.length;
    if (n == 1) return derived[0] == 0;

    int xorSum = 0;

    for (int num in derived) {
      xorSum ^= num;
    }

    return xorSum == 0;
  }
}

void main() {
  final solution = Solution();

  print(solution.doesValidArrayExist([1, 1, 0])); // true

  print(solution.doesValidArrayExist([1, 1])); // true

  print(solution.doesValidArrayExist([1, 0])); // false
}
