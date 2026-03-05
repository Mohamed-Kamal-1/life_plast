class ProductModel {
  final String name;
  final double buyingPrice;
  final double sellingPrice;
  int quantity;

  List<ProductModel> products = [];

  ProductModel({
    required this.name,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.quantity,
  });

  // نحتاج هذه الدالة لتحديث الكمية بسهولة
  ProductModel getProduct(String name) {
    ProductModel product = ProductModel(
        name: name,
        buyingPrice: buyingPrice,
        sellingPrice: sellingPrice,
        quantity: quantity);
    products.add(product);
    return product;
  }

  List<ProductModel> getListProduct() {
    return products;
  }
}
