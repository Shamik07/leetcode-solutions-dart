class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.isEmpty) return "";
    
    String prefix = strs[0];
    
    for (int i = 1; i < strs.length; i++) {
      while (!strs[i].startsWith(prefix)) {
        prefix = prefix.substring(0, prefix.length - 1);
        
        if (prefix.isEmpty) return "";
      }
    }
    
    return prefix;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.longestCommonPrefix(["flower", "flow", "flight"])); // Output: "fl"
  print(sol.longestCommonPrefix(["dog", "racecar", "car"])); // Output: ""
  print(sol.longestCommonPrefix(["interstellar", "internet", "internal"])); // Output: "inte"
}
