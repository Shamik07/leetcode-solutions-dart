List<String> findAllRecipes(List<String> recipes,
    List<List<String>> ingredients, List<String> supplies) {
  Set<String> available = supplies.toSet();
  Set<String> recipeNames = recipes.toSet();

  Map<String, List<int>> adj = {};
  List<int> inDegree = List.filled(recipes.length, 0);
  List<int> validRecipes = [];

  for (int i = 0; i < recipes.length; i++) {
    List<String> required = ingredients[i];
    bool valid = true;
    for (String ing in required) {
      if (!available.contains(ing) && !recipeNames.contains(ing)) {
        valid = false;
        break;
      }
    }
    if (!valid) continue;
    validRecipes.add(i);
    inDegree[i] = 0;
    for (String ing in required) {
      if (!available.contains(ing)) {
        inDegree[i]++;
        adj.putIfAbsent(ing, () => []).add(i);
      }
    }
  }

  List<int> queue = [];
  for (int i in validRecipes) {
    if (inDegree[i] == 0) {
      queue.add(i);
    }
  }

  List<int> result = [];
  while (queue.isNotEmpty) {
    int current = queue.removeAt(0);
    result.add(current);
    String currentRecipe = recipes[current];
    for (int neighbor in adj[currentRecipe] ?? []) {
      inDegree[neighbor]--;
      if (inDegree[neighbor] == 0) {
        queue.add(neighbor);
      }
    }
  }

  return result.map((i) => recipes[i]).toList();
}

void main() {
  // Example 1
  var example1 = findAllRecipes([
    "bread"
  ], [
    ["yeast", "flour"]
  ], [
    "yeast",
    "flour",
    "corn"
  ]);
  print(example1); // Output: ["bread"]

  // Example 2
  var example2 = findAllRecipes([
    "bread",
    "sandwich"
  ], [
    ["yeast", "flour"],
    ["bread", "meat"]
  ], [
    "yeast",
    "flour",
    "meat"
  ]);
  print(example2); // Output: ["bread", "sandwich"]

  // Example 3
  var example3 = findAllRecipes([
    "bread",
    "sandwich",
    "burger"
  ], [
    ["yeast", "flour"],
    ["bread", "meat"],
    ["sandwich", "meat", "bread"]
  ], [
    "yeast",
    "flour",
    "meat"
  ]);
  print(example3); // Output: ["bread", "sandwich", "burger"]
}
