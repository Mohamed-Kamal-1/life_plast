class ProductEntity {
  final String id;
  final String name;
  final double buyingPrice;
  final double sellingPrice;
  final int quantity;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.buyingPrice,
    required this.sellingPrice,
    required this.quantity,
  });
}
