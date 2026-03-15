import 'package:accounting_desktop/features/purchases/presentation/view/tabs/invoice/Purchase_Invoice/purchase_invoice_tab.dart';
import 'package:accounting_desktop/features/purchases/presentation/view/tabs/log/purchase_log_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart';

// ملاحظة: قم بإنشاء هذه الملفات لاحقاً للسجل والمرتجعات أو اتركها فارغة مؤقتاً
// import 'returns/purchase_return_tab.dart';
// import 'invoice/Purchases_Log/purchases_log_tab.dart';

class PurchasesScreen extends StatelessWidget {
  const PurchasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إدارة المشتريات"), // يمكنك نقلها لملف Strings
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "فاتورة مشتريات"),
              Tab(text: "مرتجع مشتريات"),
              Tab(text: "سجل المشتريات"),
            ],
          ),
        ),
        body: BlocProvider(
          // ✅ توفير كيوبيت المشتريات للشاشة بالكامل
          create: (context) => getIt.get<PurchaseInvoiceCubit>()..loadPurchaseInvoiceData(),
          child: TabBarView(
            children: [
              // 1. تابة فاتورة المشتريات (اللي عملناها فوق)
              const PurchaseInvoiceTab(
                invoiceTitleButton: "حفظ فاتورة المشتريات",
              ),

              // 2. تابة مرتجع المشتريات (مؤقتاً نص فارغ حتى تقوم ببرمجتها)

              // 3. تابة سجل المشتريات (مؤقتاً نص فارغ حتى تقوم ببرمجتها)
              const Center(child: Text("سجل فواتير المشتريات (قريباً)")),

              const PurchasesLogTab(
                invoiceTitleButton: "حفظ فاتورة المشتريات",
              ),

            ],
          ),
        ),
      ),
    );
  }
}