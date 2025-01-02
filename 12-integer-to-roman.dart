class Solution {
  String intToRoman(int num) {
    
    List<MapEntry<int, String>> romanMap = [
      MapEntry(1000, 'M'),
      MapEntry(900, 'CM'),
      MapEntry(500, 'D'),
      MapEntry(400, 'CD'),
      MapEntry(100, 'C'),
      MapEntry(90, 'XC'),
      MapEntry(50, 'L'),
      MapEntry(40, 'XL'),
      MapEntry(10, 'X'),
      MapEntry(9, 'IX'),
      MapEntry(5, 'V'),
      MapEntry(4, 'IV'),
      MapEntry(1, 'I'),
    ];

    StringBuffer result = StringBuffer();

    for (var entry in romanMap) {
      while (num >= entry.key) {
        result.write(entry.value);
        num -= entry.key;
      }
    }

    return result.toString();
  }
}

// Example Usage
void main() {
  Solution solution = Solution();
  
  print(solution.intToRoman(3749)); // Output: "MMMDCCXLIX"
  
  print(solution.intToRoman(58)); // Output: "LVIII"
  
  print(solution.intToRoman(1994)); // Output: "MCMXCIV"
  
  print(solution.intToRoman(2024)); // Output: "MMXXIV"
}
