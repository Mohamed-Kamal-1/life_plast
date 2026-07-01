import '../../domain/entities/dashboard_stats_entity.dart';

class DashboardStatsModel extends DashboardStatsEntity {
  const DashboardStatsModel({
    required super.totalSales,
    required super.totalPurchases,
    required super.customersCount,
    required super.inventoryValue,
  });

  factory DashboardStatsModel.fromJson(Map<String, dynamic> json) {
    return DashboardStatsModel(
      totalSales: (json['total_sales'] as num).toDouble(),
      totalPurchases: (json['total_purchases'] as num).toDouble(),
      customersCount: json['customers_count'] as int,
      inventoryValue: (json['inventory_value'] as num).toDouble(),
    );
  }
}
