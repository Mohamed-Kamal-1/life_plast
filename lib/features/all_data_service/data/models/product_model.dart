import 'package:accounting_desktop/features/all_data_service/data/models/product/invoice_logic/invoice_logic.dart';
import 'package:accounting_desktop/features/all_data_service/data/models/product/product_data/product_data.dart';
import 'package:accounting_desktop/features/all_data_service/data/models/product/product_logic/product_logic.dart';
import 'package:accounting_desktop/features/all_data_service/data/models/product/purchase_logic/purchase_logic..dart';
import 'package:accounting_desktop/features/all_data_service/data/models/product/sales_logic/sales_logic.dart';
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

  ProductModel copyWith({int? newQuantity}) {
    return ProductModel(
      name: name,
      buyingPrice: buyingPrice,
      sellingPrice: sellingPrice,
      quantity: newQuantity ?? quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'buyingPrice': buyingPrice,
      'sellingPrice': sellingPrice,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      buyingPrice: json['buyingPrice'],
      sellingPrice: json['sellingPrice'],
      quantity: json['quantity'],
    );
  }
}

@singleton
class ProductService with ProductData,ProductLogic,PurchaseLogic,SalesLogic,InvoiceLogic{
  ProductService() {
    loadData();
    loadSavedInvoices();
  }
}
