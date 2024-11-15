String makeFancyString(String s) {
  StringBuffer result = StringBuffer();

  int count = 1;
  result.write(s[0]); // Initialize

  for (int i = 1; i < s.length; i++) {
    if (s[i] == s[i - 1]) {
      count++; 
    } else {
      count = 1;
    }
    
    if (count < 3) {
      result.write(s[i]);
    }
  }

  return result.toString();
}

void main() {
  print(makeFancyString("leeetcode")); // Output: "leetcode"
  print(makeFancyString("aaabaaaa"));  // Output: "aabaa"
  print(makeFancyString("aab"));       // Output: "aab"
}
