import 'package:accounting_desktop/features/purchases/presentation/view/tabs/invoice/Purchase_Invoice/purchase_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/cubit/purchase_invoice_cubit/purchase_invoice_cubit.dart';
import '../../../../view_model/cubit/purchase_invoice_state/purchase_invoice_state.dart';
import 'display_purchase_info.dart';
import 'product_search_purchase_tab.dart';
import 'purchase_items_table.dart';

// import 'purchase_header_section.dart'; // افترض إنك نسخته وعدلته للمورد
// import 'display_purchase_info.dart';   // افترض إنك نسخته وعدلته للمورد

class PurchaseInvoiceTab extends StatefulWidget {
  final String invoiceTitleButton;

  const PurchaseInvoiceTab({super.key, required this.invoiceTitleButton});

  @override
  State<PurchaseInvoiceTab> createState() => _PurchaseInvoiceTabState();
}

class _PurchaseInvoiceTabState extends State<PurchaseInvoiceTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const PurchaseHeaderSection(),
          // قسم الإدخال (المورد، المندوب، التاريخ)
          const ProductSearchPurchase(),
          // ✅ السيرش الجديد مع زر الإضافة
          const DisplayPurchaseInfo(),
          // قسم العرض
          const SizedBox(height: 20),
          const Card(child: PurchaseItemsTable()),
          // ✅ الجدول الجديد (سعر الشراء)
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: BlocListener<PurchaseInvoiceCubit, PurchaseInvoiceState>(
              listener: (context, state) {
                if (state is PurchaseInvoiceSaveEmptyState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text((state.errorMessage == 'success')
                          ? 'تم حفظ فاتورة المشتريات وزيادة المخزن بنجاح'
                          : state.errorMessage),
                      backgroundColor: (state.errorMessage == 'success')
                          ? Colors.green
                          : Colors.red,
                    ),
                  );
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white, // لون يميز المشتريات
                ),
                onPressed: () {
                  context.read<PurchaseInvoiceCubit>().saveInvoicePurchase();
                },
                child: Text(widget.invoiceTitleButton),
              ),
            ),
          )
        ],
      ),
    );
  }
}
