class ProductOfNumbers {
  List<int> prefixProducts;

  ProductOfNumbers() : prefixProducts = [1];

  void add(int num) {
    if (num == 0) {
      prefixProducts = [1];
    } else {
      prefixProducts.add(prefixProducts.last * num);
    }
  }

  int getProduct(int k) {
    if (k >= prefixProducts.length) {
      return 0;
    }
    return prefixProducts[prefixProducts.length - 1] ~/
        prefixProducts[prefixProducts.length - 1 - k];
  }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * ProductOfNumbers obj = ProductOfNumbers();
 * obj.add(num);
 * int param2 = obj.getProduct(k);
 */

void main() {
  // Test Case 1
  final product1 = ProductOfNumbers();
  product1.add(3);
  product1.add(0);
  product1.add(2);
  product1.add(5);
  product1.add(4);
  print(product1.getProduct(2)); // 20
  print(product1.getProduct(3)); // 40
  print(product1.getProduct(4)); // 0

  // Test Case 2
  final product2 = ProductOfNumbers();
  product2.add(1);
  product2.add(2);
  product2.add(3);
  print(product2.getProduct(1)); // 3
  print(product2.getProduct(2)); // 6
  print(product2.getProduct(3)); // 6

  // Test Case 3
  final product3 = ProductOfNumbers();
  product3.add(5);
  product3.add(2);
  product3.add(0);
  product3.add(4);
  print(product3.getProduct(1)); // 4
  print(product3.getProduct(2)); // 0
  print(product3.getProduct(3)); // 0
}
