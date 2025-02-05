class Solution {
  bool areAlmostEqual(String s1, String s2) {
    if (s1 == s2) return true;

    if (s1.length != s2.length) return false;

    List<int> diffs = [];

    for (int i = 0; i < s1.length && diffs.length <= 2; i++) {
      if (s1[i] != s2[i]) {
        diffs.add(i);
      }
    }

    return diffs.length == 2 &&
        s1[diffs[0]] == s2[diffs[1]] &&
        s1[diffs[1]] == s2[diffs[0]];
  }
}

void main() {
  final solution = Solution();

  // Test cases
  final testCases = [
    {'s1': 'bank', 's2': 'kanb', 'expected': true},
    {'s1': 'attack', 's2': 'defend', 'expected': false},
    {'s1': 'kelb', 's2': 'kelb', 'expected': true},
  ];

  for (int i = 0; i < testCases.length; i++) {
    final test = testCases[i];
    final result =
        solution.areAlmostEqual(test['s1'] as String, test['s2'] as String);
    print('Test case ${i + 1}:');
    print('Input: s1 = "${test['s1']}", s2 = "${test['s2']}"');
    print('Expected: ${test['expected']}, Got: $result');
    print('Status: ${result == test['expected'] ? 'PASSED' : 'FAILED'}\n');
  }
}
