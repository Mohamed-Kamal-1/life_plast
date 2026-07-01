import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class AuthRemoteDataSource {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<Map<String, dynamic>> signIn(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('فشل تسجيل الدخول');
    }

    final profile = await _supabase
        .from('profiles')
        .select()
        .eq('id', response.user!.id)
        .single();

    return {
      'profile': profile,
      'email': response.user!.email,
    };
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  @override
  Future<Map<String, dynamic>?> getCurrentUserData() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;

    final profile =
        await _supabase.from('profiles').select().eq('id', user.id).single();

    return {
      'profile': profile,
      'email': user.email,
    };
  }
}
