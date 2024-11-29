bool stoneRemovalGame(int n) {
  int currentMove = 10;
  bool isAliceTurn = true;

  while (n > 0) {
    if (n < currentMove) {
      return !isAliceTurn;
    }
    n -= currentMove;
    currentMove--;
    isAliceTurn = !isAliceTurn;
  }
  // loop ends = current player took the last stone
  return !isAliceTurn;
}

void main() {
  print(stoneRemovalGame(12)); // true
  print(stoneRemovalGame(1)); // false
  print(stoneRemovalGame(15)); // true
}
