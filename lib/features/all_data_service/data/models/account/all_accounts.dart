import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountModel {
  final String id;
  final String name;
  final String phone;
  final String city;
  final String type; // 'customer', 'supplier', 'employee', 'representative'

  AccountModel({
    required this.id,
    required this.name,
    required this.phone,
    this.city = '',
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'city': city,
        'type': type,
      };

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        city: json['city'],
        type: json['type'],
      );
}

@singleton
class AccountService {
  List<AccountModel> _customers = [];
  List<AccountModel> _suppliers = [];
  List<AccountModel> _employees = [];
  List<AccountModel> _reps = [];

  // بيانات افتراضية (Static Data) لكل الفئات للتجربة
  final List<AccountModel> _staticCustomers = [
    AccountModel(
        id: 'c1',
        name: 'عميل نقدي',
        phone: '010',
        city: 'القاهرة',
        type: 'customer'),
    AccountModel(
        id: 'c2',
        name: 'شركة الأمل',
        phone: '011',
        city: 'الجيزة',
        type: 'customer'),
  ];
  final List<AccountModel> _staticSuppliers = [
    AccountModel(
        id: 's1',
        name: 'مورد النور',
        phone: '012',
        city: 'طنطا',
        type: 'supplier'),
  ];
  final List<AccountModel> _staticEmployees = [
    AccountModel(
        id: 'e1',
        name: 'المحاسب علي',
        phone: '015',
        city: 'القاهرة',
        type: 'employee'),
  ];
  final List<AccountModel> _staticReps = [
    AccountModel(
        id: 'r1',
        name: 'المندوب كمال',
        phone: '0109',
        city: 'المنصورة',
        type: 'rep'),
  ];

  List<AccountModel> get customers => _customers;

  List<AccountModel> get suppliers => _suppliers;

  List<AccountModel> get employees => _employees;

  List<AccountModel> get reps => _reps;

  AccountService() {
    _loadAllData(); // تحميل كل البيانات فور التشغيل
  }

  Future<void> _loadAllData() async {
    final prefs = await SharedPreferences.getInstance();

    // تحميل العملاء
    _customers = _decode(prefs.getString('saved_customer')) ??
        List.from(_staticCustomers);
    // تحميل الموردين
    _suppliers = _decode(prefs.getString('saved_supplier')) ??
        List.from(_staticSuppliers);
    // تحميل الموظفين
    _employees = _decode(prefs.getString('saved_employee')) ??
        List.from(_staticEmployees);
    // تحميل المناديب
    _reps = _decode(prefs.getString('saved_rep')) ?? List.from(_staticReps);

    // حفظ البيانات المبدئية لو الذاكرة فاضية تماماً (لأول مرة فقط)
    _checkAndInitialSave(prefs);
  }

  List<AccountModel>? _decode(String? data) {
    if (data == null) return null;
    return (json.decode(data) as List)
        .map((i) => AccountModel.fromJson(i))
        .toList();
  }

  // إضافة حساب مع حفظ تلقائي بناءً على النوع
  void addAccount(AccountModel account) {
    switch (account.type) {
      case 'customer':
        _customers.add(account);
        break;
      case 'supplier':
        _suppliers.add(account);
        break;
      case 'employee':
        _employees.add(account);
        break;
      case 'representative':
        _reps.add(account);
        break;
    }
    _saveToStorage(account.type);
  }

  // دالة الحذف الموحدة
  void deleteAccount(String id, String type) {
    if (type == 'customer') {
      _customers.removeWhere((a) => a.id == id);
    } else if (type == 'supplier') {
      _suppliers.removeWhere((a) => a.id == id);
    } else if (type == 'employee') {
      _employees.removeWhere((a) => a.id == id);
    } else {
      _reps.removeWhere((a) => a.id == id);
    }

    _saveToStorage(type);
  }

  // حفظ الداتا في الذاكرة (إجباري Await لضمان الثبات)
  Future<void> _saveToStorage(String type) async {
    final prefs = await SharedPreferences.getInstance();
    List<AccountModel> targetList;

    switch (type) {
      case 'customer':
        targetList = _customers;
        break;
      case 'supplier':
        targetList = _suppliers;
        break;
      case 'employee':
        targetList = _employees;
        break;
      case 'representative':
        targetList = _reps;
        break;
      default:
        return;
    }

    await prefs.setString(
        'saved_$type', json.encode(targetList.map((a) => a.toJson()).toList()));
  }

  void _checkAndInitialSave(SharedPreferences prefs) {
    if (prefs.getString('saved_customer') == null) _saveToStorage('customer');
    if (prefs.getString('saved_supplier') == null) _saveToStorage('supplier');
    if (prefs.getString('saved_employee') == null) _saveToStorage('employee');
    if (prefs.getString('saved_rep') == null) _saveToStorage('representative');
  }
}
