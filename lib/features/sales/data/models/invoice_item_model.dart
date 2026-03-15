

import '../../../all_data_service/data/models/product_model.dart';

class InvoiceModel {
  final String id;
  final String customerName;
  final String repName;
  final String phone;
  final String date;
  final List<ProductModel> items;
  final double total;
  final bool isReturn;

  InvoiceModel({
    required this.id,
    required this.customerName,
    required this.repName,
    required this.phone,
    required this.date,
    required this.items,
    required this.total,
    this.isReturn = false,
  });

  // تحويل الفاتورة لـ Map عشان تتخزن JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'customerName': customerName,
    'repName': repName,
    'phone': phone,
    'date': date,
    'items': items.map((item) => item.toJson()).toList(),
    'total': total,
    'isReturn': isReturn,
  };

  // استرجاع الفاتورة من JSON
  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    id: json['id'],
    customerName: json['customerName'],
    repName: json['repName'],
    phone: json['phone'],
    date: json['date'],
    items: (json['items'] as List)
        .map((item) => ProductModel.fromJson(item))
        .toList(),
    total: json['total'],
    isReturn: json['isReturn'] ?? false,
  );
}