import 'package:flutter/material.dart';

class SidebarItem {
  final String title;
  final IconData icon;
  final String route;
  final List<String> roles;

  const SidebarItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.roles,
  });
}

// قائمة اللينكات مطابقة لما كان لديك في الويب
const List<SidebarItem> appMenuItems = [
  SidebarItem(
      title: 'لوحة التحكم',
      icon: Icons.dashboard,
      route: '/dashboard',
      roles: ['admin']),
  SidebarItem(
      title: 'فاتورة بيع',
      icon: Icons.receipt,
      route: '/sales',
      roles: ['admin', 'sales']),
  SidebarItem(
      title: 'المشتريات',
      icon: Icons.shopping_cart,
      route: '/purchases',
      roles: ['admin']),
  SidebarItem(
      title: 'المرتجعات',
      icon: Icons.assignment_return,
      route: '/returns',
      roles: ['admin']),
  SidebarItem(
      title: 'الخزينة',
      icon: Icons.account_balance_wallet,
      route: '/finance',
      roles: ['admin']),
  SidebarItem(
      title: 'المخزن',
      icon: Icons.inventory,
      route: '/inventory',
      roles: ['admin']),
  SidebarItem(
      title: 'معاينات',
      icon: Icons.search,
      route: '/preview',
      roles: ['preview', 'admin']),
  SidebarItem(
      title: 'مخزني',
      icon: Icons.inventory_2,
      route: '/salesman_inventory',
      roles: ['sales']),
  SidebarItem(
      title: 'طلب معاينة',
      icon: Icons.handyman,
      route: '/preview_request',
      roles: ['technician']),
  SidebarItem(
      title: 'الإعدادات',
      icon: Icons.settings,
      route: '/settings',
      roles: ['admin']),
];
