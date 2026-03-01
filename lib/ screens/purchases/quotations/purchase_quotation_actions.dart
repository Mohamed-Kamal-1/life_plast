import 'package:flutter/material.dart';

class PurchaseQuotationActions extends StatelessWidget {
  const PurchaseQuotationActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            _showConvertDialog(context);
          },
          icon: const Icon(Icons.transform),
          label: const Text('تحويل إلى فاتورة شراء'),
        ),
        const SizedBox(width: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.print),
          label: const Text('طباعة العرض'),
        ),
      ],
    );
  }

  void _showConvertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('تحويل عرض شراء'),
          content: const Text(
            'هل تريد تحويل عرض الشراء الحالي إلى فاتورة شراء؟',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSuccess(context);
              },
              child: const Text('تحويل'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم تحويل العرض إلى فاتورة شراء بنجاح'),
      ),
    );
  }
}