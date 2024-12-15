class Solution {
  double maxAverageRatio(List<List<int>> classes, int extraStudents) {
    double improvement(int pass, int total) {
      return (pass + 1) / (total + 1) - pass / total;
    }

    List<List<dynamic>> maxHeap = [];

    void heapifyUp(int index) {
      while (index > 0) {
        int parent = (index - 1) ~/ 2;
        if (maxHeap[index][2] > maxHeap[parent][2]) {
          var temp = maxHeap[index];
          maxHeap[index] = maxHeap[parent];
          maxHeap[parent] = temp;
          index = parent;
        } else {
          break;
        }
      }
    }

    void heapifyDown(int index) {
      int size = maxHeap.length;
      while (true) {
        int left = 2 * index + 1;
        int right = 2 * index + 2;
        int largest = index;

        if (left < size && maxHeap[left][2] > maxHeap[largest][2]) {
          largest = left;
        }

        if (right < size && maxHeap[right][2] > maxHeap[largest][2]) {
          largest = right;
        }

        if (largest != index) {
          var temp = maxHeap[index];
          maxHeap[index] = maxHeap[largest];
          maxHeap[largest] = temp;
          index = largest;
        } else {
          break;
        }
      }
    }

    for (var cls in classes) {
      int pass = cls[0], total = cls[1];
      maxHeap.add([pass, total, improvement(pass, total)]);
      heapifyUp(maxHeap.length - 1);
    }

    for (int i = 0; i < extraStudents; i++) {
      var topClass = maxHeap[0];
      int pass = topClass[0], total = topClass[1];
      pass += 1;
      total += 1;

      maxHeap[0] = [pass, total, improvement(pass, total)];
      heapifyDown(0);
    }

    double totalRatio = 0.0;
    for (var cls in maxHeap) {
      totalRatio += cls[0] / cls[1];
    }

    return totalRatio / classes.length;
  }
}

void main() {
  var solution = Solution();
  print(solution.maxAverageRatio([
    [1, 2],
    [3, 5],
    [2, 2]
  ], 2)); // Output: 0.78333
  print(solution.maxAverageRatio([
    [2, 4],
    [3, 9],
    [4, 5],
    [2, 10]
  ], 4)); // Output: 0.53485

  var classes = [
    [129, 381],
    [729, 1000],
    [15, 551],
    [207, 789],
    [276, 638],
    [67, 830],
    [474, 804],
    [13, 291],
    [273, 663],
    [743, 985],
    [514, 709],
    [23, 580],
    [115, 412],
    [101, 702],
    [330, 620],
    [635, 653],
    [705, 713],
    [587, 951],
    [459, 909],
    [94, 626],
    [511, 543],
    [352, 604],
    [696, 895],
    [45, 193],
    [57, 174],
    [120, 632],
    [44, 826],
    [121, 569],
    [313, 543],
    [772, 804],
    [166, 206],
    [154, 547],
    [234, 887],
    [92, 223],
    [362, 516],
    [707, 920],
    [577, 861],
  ];
  print(solution.maxAverageRatio(classes, 100)); // Optimized for large inputs.
}
