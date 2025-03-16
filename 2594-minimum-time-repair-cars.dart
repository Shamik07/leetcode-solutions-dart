import 'dart:math' as math;

int repairCars(List<int> ranks, int cars) {
  if (ranks.isEmpty || cars <= 0) {
    throw ArgumentError("Invalid");
  }

  // bs
  int left = 1;
  int minRank = ranks.reduce((a, b) => a < b ? a : b); 
  int right = minRank * cars * cars; 

  while (left < right) {
    int mid = left + (right - left) ~/ 2;

    if (canRepairAllCars(ranks, cars, mid)) {
      right = mid;
    } else {
      left = mid + 1;
    }
  }

  return left;
}

bool canRepairAllCars(List<int> ranks, int cars, int time) {
  int repairedCars = 0;

  for (int rank in ranks) {
    if (rank > time) {
      continue; 
    }

    int carsRepairedByMechanic = math.sqrt(time ~/ rank).floor();
    repairedCars += carsRepairedByMechanic;

    if (repairedCars >= cars) {
      return true;
    }
  }

  return false;
}

void main() {
  // Example 1
  List<int> ranks1 = [4, 2, 3, 1];
  int cars1 = 10;
  int result1 = repairCars(ranks1, cars1);
  print('Example 1:');
  print('Input: ranks = [4, 2, 3, 1], cars = 10');
  print('Output: $result1');
  print('');

  // Example 2
  List<int> ranks2 = [5, 1, 8];
  int cars2 = 6;
  int result2 = repairCars(ranks2, cars2);
  print('Example 2:');
  print('Input: ranks = [5, 1, 8], cars = 6');
  print('Output: $result2');
}