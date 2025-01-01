class Solution {
  int strStr(String haystack, String needle) {
    int hLen = haystack.length;
    int nLen = needle.length;
    
    for (int i = 0; i <= hLen - nLen; i++) {
      if (haystack.substring(i, i + nLen) == needle) {
        return i;
      }
    }
    
    return -1;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.strStr("sadbutsad", "sad")); // Output: 0
  print(sol.strStr("leetcode", "leeto")); // Output: -1
}
