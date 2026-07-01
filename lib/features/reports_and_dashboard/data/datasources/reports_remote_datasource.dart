import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@singleton
class ReportsRemoteDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> fetchDashboardStats() async {
    final response = await _supabase.rpc('get_dashboard_stats');
    return response as Map<String, dynamic>;
  }
}
