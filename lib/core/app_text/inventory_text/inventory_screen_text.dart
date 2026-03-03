abstract class InventoryScreenText {
  static const String screenTitle = 'إدارة الأصناف والمخزون';

  // Table Columns
  static const String colCode = 'كود';
  static const String colName = 'اسم الصنف';
  static const String colCategory = 'التصنيف';
  static const String colUnit = 'الوحدة';
  static const String colCurrentQty = 'الكمية الحالية';
  static const String colReorderLevel = 'حد إعادة الطلب';
  static const String colUnitCost = 'تكلفة الوحدة';
  static const String colStatus = 'الحالة';
  static const String colAction = 'إجراء';

  // Tabs
  static const String tabItemsList = 'قائمة الأصناف';
  static const String tabMovements = 'حركات المخزن';
  static const String tabAlerts = 'تنبيهات النواقص';

  // Filters & Search
  static const String searchHint = 'ابحث بكود أو اسم الصنف...';
  static const String filterCategory = 'التصنيف';
  static const String catAll = 'الكل';
  static const String catFinal = 'منتج نهائي';
  static const String catRaw = 'مواد خام';

  // Messages
  static const String msgNoMovements = 'سجل الحركات (قريباً)';
  static const String msgNoAlerts = 'الأصناف تحت حد الطلب';
}