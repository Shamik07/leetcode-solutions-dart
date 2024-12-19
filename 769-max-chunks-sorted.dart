class Solution {
  int maxChunksToSorted(List<int> arr) {
    int n = arr.length;
    int maxSeen = 0;
    int chunks = 0;

    for (int i = 0; i < n; i++) {
      maxSeen = maxSeen > arr[i] ? maxSeen : arr[i];
      if (maxSeen == i) {
        chunks++;
      }
    }

    return chunks;
  }
}

void main() {
  Solution solution = new Solution();

  List<int> arr1 = [4, 3, 2, 1, 0];
  print(solution.maxChunksToSorted(arr1)); // Output: 1

  List<int> arr2 = [1, 0, 2, 3, 4];
  print(solution.maxChunksToSorted(arr2)); // Output: 4

  List<int> arr3 = [0, 1, 2, 3, 4];
  print(solution.maxChunksToSorted(arr3)); // Output: 5
}
