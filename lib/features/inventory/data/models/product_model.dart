import 'package:injectable/injectable.dart';

class ProductModel {
  final String name;
  final double buyingPrice;
  final double sellingPrice;
  int quantity;

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
    return product;
  }
}

@singleton
class ProductService {
  // القائمة أصبحت هنا في مكان واحد مشترك
  final List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
  }
}
