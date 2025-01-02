class Solution {
  int maxArea(List<int> height) {
    int left = 0;
    int right = height.length - 1;
    int maxWater = 0;

    while (left < right) {
      int width = right - left;
      int currentHeight = height[left] < height[right] ? height[left] : height[right];
      int currentArea = width * currentHeight;
      
      maxWater = currentArea > maxWater ? currentArea : maxWater;

      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxWater;
  }
}

// Example Usage
void main() {
  Solution solution = Solution();
  
  List<int> heights1 = [1,8,6,2,5,4,8,3,7];
  print(solution.maxArea(heights1)); // Output: 49

  List<int> heights2 = [1,1];
  print(solution.maxArea(heights2)); // Output: 1

  List<int> heights3 = [4,3,2,1,4];
  print(solution.maxArea(heights3)); // Output: 16

  List<int> heights4 = [1,2,1];
  print(solution.maxArea(heights4)); // Output: 2
}
