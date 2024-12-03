class Solution {
  String addSpaces(String s, List<int> spaces) {
    StringBuffer result = StringBuffer();

    int spaceIndex = 0; 
    for (int i = 0; i < s.length; i++) {
      if (spaceIndex < spaces.length && i == spaces[spaceIndex]) {
        result.write(' '); 
        spaceIndex++; 
      }
      result.write(s[i]); 
    }
  
    return result.toString();
  }
}

void main() {
  Solution solution = new Solution();
  // Test cases
  print(solution.addSpaces("LeetcodeHelpsMeLearn", [8, 13, 15])); // Output: "Leetcode Helps Me Learn"
  print(solution.addSpaces("icodeindart", [1, 5, 7, 9])); // Output: "i code in da rt"
  print(solution.addSpaces("spacing", [0, 1, 2, 3, 4, 5, 6])); // Output: " s p a c i n g"
}

