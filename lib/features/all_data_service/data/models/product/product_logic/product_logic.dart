import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../product_model.dart';
import '../product_data/product_data.dart';

mixin ProductLogic on ProductData {
  @protected
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedData = prefs.getString('saved_products');

    if (savedData != null) {
      List<dynamic> decodedData = json.decode(savedData);
      allProducts =
          decodedData.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      allProducts = List.from(initialData);
      saveDataToStorage();
    }
  }

  @protected
  Future<void> saveDataToStorage() async {
    final prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> jsonData =
        allProducts.map((p) => p.toJson()).toList();
    await prefs.setString('saved_products', json.encode(jsonData));
  }

  void addProduct(ProductModel product) {
    allProducts.add(product);
    saveDataToStorage();
  }

  void addPurchaseProduct(ProductModel product) {
    allProducts.add(product);
    saveDataToStorage();
  }

  void deleteProduct(String name) {
    allProducts.removeWhere((p) => p.name == name);
    saveDataToStorage(); // الحفظ الإجباري عشان الداتا متثبتش
  }
}
