import 'dart:math';

List<int> partitionLabels(String s) {
  List<int> codeUnits = s.codeUnits;
  List<int> lastOccurrence = List.filled(26, -1);
  int aCode = 'a'.codeUnitAt(0);

  for (int i = 0; i < codeUnits.length; i++) {
    lastOccurrence[codeUnits[i] - aCode] = i;
  }

  List<int> result = [];
  int start = 0;
  int end = 0;

  for (int i = 0; i < codeUnits.length; i++) {
    end = max(end, lastOccurrence[codeUnits[i] - aCode]);

    if (i == end) {
      result.add(end - start + 1);
      start = i + 1;
    }
  }

  return result;
}

void main() {
  print(
      'Example 1: ${partitionLabels("ababcbacadefegdehijhklij")}'); // [9, 7, 8]
  print('Example 2: ${partitionLabels("eccbbbbdec")}'); //  [10]
}
