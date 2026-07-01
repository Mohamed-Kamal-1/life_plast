/// Application-wide constants.
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'لايف بلاست';
  static const String appNameEn = 'Life Plast';
  static const String appVersion = '1.0.0';

  // Firestore Collection Names
  static const String usersCollection = 'users';
  static const String warehousesCollection = 'warehouses';
  static const String productsCollection = 'products';
  static const String inventoryCollection = 'inventory';
  static const String salesCollection = 'sales';
  static const String invoicesCollection = 'invoices';
  static const String merchantsCollection = 'merchants';
  static const String stockTransfersCollection = 'stock_transfers';
  static const String reconciliationsCollection = 'reconciliations';
  static const String treasuryCollection = 'treasury';

  // User Roles
  static const String roleOwner = 'owner';
  static const String roleAdmin = 'admin';
  static const String roleSalesRep = 'sales_rep';

  // Warehouse Types
  static const String warehouseMain = 'main';
  static const String warehouseVirtual = 'virtual';

  // Payment Types
  static const String paymentCash = 'cash';
  static const String paymentCredit = 'credit';

  // Responsive Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
}
