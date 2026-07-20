// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../features/auth/presentation/cubit/auth_cubit.dart';
// import '../features/auth/presentation/view/login_screen.dart';
// import '../widgets/sidebar_widget.dart';
// import 'navigation_controller.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key});
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   final NavigationController _navController = NavigationController();
//
//   // void _onLogout() {
//   //   context.read<AuthCubit>().logout();
//   //   // استخدام pushAndRemoveUntil عشان يمسح الـ Stack تماماً وما يرجعش بظهر الزرار
//   //   Navigator.of(context).pushAndRemoveUntil(
//   //     MaterialPageRoute(builder: (_) => const LoginScreen()),
//   //     (route) => false,
//   //   );
//   // }
//
//   @override
//   void dispose() {
//     _navController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width > 800;
//
//     return ListenableBuilder(
//       listenable: _navController,
//       builder: (context, child) {
//         return Scaffold(
//           key: _navController.scaffoldKey,
//           appBar: isDesktop
//               ? null
//               : AppBar(title: const Text('نظام إدارة الأعمال')),
//           drawer: isDesktop
//               ? null
//               : Drawer(
//                   child: SidebarWidget(
//                     currentScreen: _navController.currentScreen,
//                     onItemSelected: (screen) {
//                       _navController.changeScreen(screen);
//                       _navController.scaffoldKey.currentState?.closeDrawer();
//                     },
//                     onLogout: _onLogout,
//                   ),
//                 ),
//           body: Row(
//             children: [
//               if (isDesktop)
//                 SidebarWidget(
//                   currentScreen: _navController.currentScreen,
//                   onItemSelected: _navController.changeScreen,
//                   onLogout: _onLogout,
//                 ),
//               Expanded(
//                 child: _navController.currentWidget,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
