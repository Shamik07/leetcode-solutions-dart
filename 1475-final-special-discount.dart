class Solution {
  List<int> finalPrices(List<int> prices) {
    int n = prices.length;
    List<int> result = List<int>.from(prices);
    List<int> stack = [];

    for (int i = 0; i < n; i++) {
      while (stack.isNotEmpty && prices[stack.last] >= prices[i]) {
        int index = stack.removeLast();
        result[index] = prices[index] - prices[i];
      }
      stack.add(i);
    }

    return result;
  }
}

void main() {
  Solution solution = new Solution();

  print(solution.finalPrices([8, 4, 6, 2, 3])); // Output: [4, 2, 4, 2, 3]
  print(solution.finalPrices([1, 2, 3, 4, 5])); // Output: [1, 2, 3, 4, 5]
  print(solution.finalPrices([10, 1, 1, 6])); // Output: [9, 0, 1, 6]
}
