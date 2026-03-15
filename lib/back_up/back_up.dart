// @singleton
// class ProductService {
//   int _lastInvoiceNumber = 0;
//
//   int get nextInvoiceNumber => _lastInvoiceNumber + 1;
//   List<ProductModel> _allProducts = [];
//   final List<ProductModel> _currentInvoiceItems = [];
//
//   List<InvoiceModel> _allSavedInvoices = []; // سجل الفواتير
//   List<InvoiceModel> get allSavedInvoices => _allSavedInvoices;
//
//   final List<ProductModel> _initialData = [
//     ProductModel(
//         name: "صنف تجريبي 1",
//         buyingPrice: 100,
//         sellingPrice: 150,
//         quantity: 50),
//     ProductModel(
//         name: "صنف تجريبي 2",
//         buyingPrice: 200,
//         sellingPrice: 280,
//         quantity: 30),
//   ];
//
//   List<ProductModel> get products => _allProducts;
//
//   List<ProductModel> get invoiceItems => _currentInvoiceItems;
//
//   ProductService() {
//     _loadData(); // تحميل الأصناف
//     _loadSavedInvoices();
//   }
//
//   Future<void> _loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? savedData = prefs.getString('saved_products');
//
//     if (savedData != null) {
//       List<dynamic> decodedData = json.decode(savedData);
//       _allProducts =
//           decodedData.map((item) => ProductModel.fromJson(item)).toList();
//     } else {
//       _allProducts = List.from(_initialData);
//       _saveDataToStorage();
//     }
//   }
//
//   Future<void> _saveDataToStorage() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     List<Map<String, dynamic>> jsonData =
//     _allProducts.map((p) => p.toJson()).toList();
//     await prefs.setString('saved_products', json.encode(jsonData));
//   }
//
//   ////////////////  ////////////////  ////////////////  ////////////////
//   //                              Product
//   ////////////////  ////////////////  ////////////////  ////////////////
//
//   void addProduct(ProductModel product) {
//     _allProducts.add(product);
//     _saveDataToStorage();
//   }
//
//   void deleteProduct(String name) {
//     _allProducts.removeWhere((p) => p.name == name);
//     _saveDataToStorage(); // الحفظ الإجباري عشان الداتا متثبتش
//   }
//
//   ////////////////  ////////////////  ////////////////  ////////////////
//   //                              Invoice
//   ////////////////  ////////////////  ////////////////  ////////////////
//
//   Future<void> _loadSavedInvoices() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     // تحميل آخر رقم فاتورة تم استخدامه
//     _lastInvoiceNumber = prefs.getInt('last_inv_num') ?? 0;
//
//     final String? savedData = prefs.getString('all_saved_invoices');
//     if (savedData != null) {
//       List<dynamic> decodedData = json.decode(savedData);
//       _allSavedInvoices =
//           decodedData.map((item) => InvoiceModel.fromJson(item)).toList();
//       // ملحوظة: حذفنا هنا كود "if (lastInvDate != todayDate)" تماماً
//     }
//   }
//
// // 2. تعديل دالة الحفظ: بتزود وتثبت الرقم في الذاكرة
//   void saveInvoice(InvoiceModel invoice) async {
//     final prefs = await SharedPreferences.getInstance();
//     for (var saleItem in invoice.items) {
//       int index = _allProducts.indexWhere((p) => p.name == saleItem.name);
//       if (index != -1) {
//         if (invoice.isReturn) {
//           // لو مرتجع: زود الكمية في المخزن
//           _allProducts[index].quantity += saleItem.quantity;
//         } else {
//           // لو بيع: اخصم الكمية من المخزن
//           _allProducts[index].quantity -= saleItem.quantity;
//         }
//       }
//     }
//
//     // زيادة العداد
//     _lastInvoiceNumber++;
//
//     // حفظ الرقم الجديد فوراً في الذاكرة الدائمة
//     await prefs.setInt('last_inv_num', _lastInvoiceNumber);
//
//     // حفظ سجل الفواتير (الـ Log)
//     _allSavedInvoices.add(invoice);
//     String encodedData =
//     json.encode(_allSavedInvoices.map((inv) => inv.toJson()).toList());
//     await prefs.setString('all_saved_invoices', encodedData);
//
//     _currentInvoiceItems.clear();
//     _saveDataToStorage();
//   }
//
//   // Future<void> _loadSavedInvoices() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //     await prefs.setInt('last_inv_num', _lastInvoiceNumber);
//   //   _lastInvoiceNumber = prefs.getInt('last_inv_num') ?? 0;
//   //   final String? savedData = prefs.getString('all_saved_invoices');
//   //
//   //
//   //   if (savedData != null) {
//   //     List<dynamic> decodedData = json.decode(savedData);
//   //     _allSavedInvoices =
//   //         decodedData.map((item) => InvoiceModel.fromJson(item)).toList();
//   //   }
//   //
//   //   if (_allSavedInvoices.isNotEmpty) {
//   //     String lastInvDate = _allSavedInvoices.last.date;
//   //     String todayDate = DateTime.now().toString().split(' ')[0];
//   //
//   //     if (lastInvDate != todayDate) {
//   //       _lastInvoiceNumber = 0; // يرجع لـ 0 عشان يبدأ 1 في اليوم الجديد
//   //
//   //     }
//   //   }
//   // }
//
//   // داخل ProductService
//   Future<void> _saveInvoicesToStorage() async {
//     final prefs = await SharedPreferences.getInstance();
//     // تحويل قائمة الفواتير لـ JSON وتخزينها
//     List<Map<String, dynamic>> jsonData =
//     _allSavedInvoices.map((inv) => inv.toJson()).toList();
//     await prefs.setString('all_saved_invoices', json.encode(jsonData));
//   }
//
//   void addToInvoice(ProductModel product) {
//     _currentInvoiceItems.add(product);
//   }
//
//   void removeFromInvoice(int index) {
//     _currentInvoiceItems.removeAt(index);
//   }
//
//   // داخل ProductService
//
//   Future<void> clearInvoiceHistory() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     // 1. مسح البيانات من الذاكرة الدائمة
//     await prefs.remove('all_saved_invoices');
//     await prefs.remove('last_inv_num');
//
//     // 2. تصفير البيانات في الرام (RAM) عشان الشاشة تتحدث فوراً
//     _allSavedInvoices.clear();
//     _lastInvoiceNumber = 0;
//
//     // (اختياري) لو عاوز تمسح الأصناف الحالية في الجدول برضه
//     _currentInvoiceItems.clear();
//   }
//
//   double get invoiceTotal => _currentInvoiceItems.fold(
//       0, (sum, item) => sum + (item.sellingPrice * item.quantity));
// }
// ممكن احول ده ليه ميكسن