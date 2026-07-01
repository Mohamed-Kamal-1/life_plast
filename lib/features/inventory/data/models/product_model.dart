import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.buyingPrice,
    required super.sellingPrice,
    required super.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      buyingPrice: (json['buying_price'] as num).toDouble(),
      sellingPrice: (json['selling_price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'buying_price': buyingPrice,
      'selling_price': sellingPrice,
      'quantity': quantity,
    };
  }
}
