import 'dart:math';

class DigitCounter {
  Map<String, BigInt> memo = {};
  late String numStr;
  late int digitLimit;

  BigInt dp(int index, bool tight, bool isLeadingZero) {
    if (index == numStr.length) {
      return BigInt.one;
    }
    String key = "$index-$tight-$isLeadingZero";
    if (memo.containsKey(key)) {
      return memo[key]!;
    }

    BigInt ans = BigInt.zero;
    int currentDigitLimit = tight ? int.parse(numStr[index]) : 9;
    int upperBound = min(currentDigitLimit, digitLimit);

    for (int digit = 0; digit <= upperBound; digit++) {
      bool newTight = tight && (digit == currentDigitLimit);
      ans += dp(index + 1, newTight, isLeadingZero && (digit == 0));
    }

    memo[key] = ans;
    return ans;
  }

  BigInt count(BigInt n, int limit) {
    if (n < BigInt.zero) {
      return BigInt.zero;
    }
    numStr = n.toString();
    digitLimit = limit;
    memo.clear(); // new count.
    return dp(0, true, true);
  }
}

BigInt countUpTo(BigInt n, int limit) {
  return DigitCounter().count(n, limit);
}

BigInt solve(BigInt n, int limit, String s) {
  for (int i = 0; i < s.length; i++) {
    if (int.parse(s[i]) > limit) {
      return BigInt.zero;
    }
  }

  BigInt sValue = BigInt.parse(s);
  if (n < sValue) {
    return BigInt.zero;
  }

  BigInt power = BigInt.from(10).pow(s.length);
  // count of 'y' such that x = y * 10^L + s <= n.
  BigInt nPrime = (n - sValue) ~/ power;

  return countUpTo(nPrime, limit);
}

int countPowerfulIntegers(int start, int finish, int limit, String s) {
  BigInt finishBig = BigInt.from(finish);
  BigInt startMinusOneBig = BigInt.from(start) - BigInt.one;

  BigInt countFinish = solve(finishBig, limit, s);
  BigInt countStart = solve(startMinusOneBig, limit, s);

  BigInt result = countFinish - countStart;
  return result.toInt();
}

void main() {
  // Example 1
  int start1 = 1;
  int finish1 = 6000;
  int limit1 = 4;
  String s1 = "124";
  print("Expected: 5");
  print("Output: ${countPowerfulIntegers(start1, finish1, limit1, s1)}");

  // Example 2
  int start2 = 15;
  int finish2 = 215;
  int limit2 = 6;
  String s2 = "10";
  print("Expected: 2");
  print("Output: ${countPowerfulIntegers(start2, finish2, limit2, s2)}");
}
