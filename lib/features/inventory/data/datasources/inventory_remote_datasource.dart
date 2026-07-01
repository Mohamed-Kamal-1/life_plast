import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class InventoryRemoteDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await _supabase
        .from('products')
        .select()
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<void> insertProduct(Map<String, dynamic> productData) async {
    await _supabase.from('products').upsert(productData);
  }

  Future<void> removeProduct(String id) async {
    await _supabase.from('products').delete().eq('id', id);
  }

  Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    final response = await _supabase
        .from('products')
        .select()
        .ilike('name', '%$query%')
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }
}
