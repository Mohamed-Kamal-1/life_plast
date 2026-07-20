import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/login_screen.dart';
import '../../features/contacts/presentation/view/contacts_screen.dart';
import '../../features/inventory/presentation/view/inventory_screen.dart';
import '../../features/reports_and_dashboard/view/dashboard_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String contacts = '/contacts';
  static const String dashboard = '/dashboard';

  static const String inventory = '/inventory';
}

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.login, // يبدأ من صفحة اللوجن
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.contacts,
        builder: (context, state) => const ContactsScreen(),
      ),
      GoRoute(
        path: AppRoutes.inventory,
        builder: (context, state) => const InventoryScreen(),
      ),
    ],
  );
}
