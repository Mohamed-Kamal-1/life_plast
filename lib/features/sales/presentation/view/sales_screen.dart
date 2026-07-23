import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../inventory/presentation/cubit/sales_cubit.dart';
import '../../../inventory/presentation/cubit/sales_state.dart';
import '../../domain/entities/sale_invoice_entity.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String currentMode = 'merchant';

  String selectedContactId = '';
  String selectedContactName = '';
  List<SaleInvoiceItemEntity> cart = [];

  double subTotal = 0.0;
  double invoiceDiscountPercent = 0.0;
  double grandTotal = 0.0;
  double paidAmount = 0.0;
  double remainingAmount = 0.0;

  final TextEditingController discountController =
      TextEditingController(text: '0');
  final TextEditingController paidController = TextEditingController(text: '0');
  final TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    discountController.dispose();
    paidController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _calculateTotals() {
    subTotal = cart.fold(0, (sum, item) => sum + item.total);
    invoiceDiscountPercent = double.tryParse(discountController.text) ?? 0.0;

    grandTotal = subTotal - (subTotal * (invoiceDiscountPercent / 100));
    paidAmount = double.tryParse(paidController.text) ?? 0.0;
    remainingAmount = grandTotal - paidAmount;

    setState(() {});
  }

  void _addItemToCart(String pId, String pName, double price, int qty) {
    setState(() {
      cart.add(SaleInvoiceItemEntity(
        productId: pId,
        productName: pName,
        unitPrice: price,
        quantity: qty,
        itemDiscountPercent: 0,
        total: price * qty,
      ));
      _calculateTotals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SalesCubit>(
      create: (context) => getIt.get<SalesCubit>(),
      child: BlocConsumer<SalesCubit, SalesState>(
        listener: (context, state) {
          if (state is SalesSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ تم حفظ الفاتورة بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            setState(() {
              cart.clear();
              discountController.text = '0';
              paidController.text = '0';
              _calculateTotals();
            });
          } else if (state is SalesErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('❌ خطأ: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent, // تعتمد على لون الهيكل الرئيسي
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '📦 إنشاء عملية بيع',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 1. التبويبات
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        _buildTab('تاجر (عميل)', 'merchant', Icons.store),
                        const SizedBox(width: 8),
                        _buildTab('مندوب', 'salesman', Icons.local_shipping),
                        const SizedBox(width: 8),
                        _buildTab('مورد', 'supplier', Icons.factory),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 2. البحث والتفاصيل
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'ابحث عن العميل / المندوب...',
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                labelText: 'المدينة / المنطقة',
                                prefixIcon: Icon(Icons.location_city),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 3. إضافة صنف
                  Card(
                    elevation: 2,
                    color: Colors.blue.shade50.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.blue.shade200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'ابحث عن صنف بالمخزن...',
                                prefixIcon: Icon(Icons.inventory_2),
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'الكمية',
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            height: 52,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _addItemToCart(
                                    'test_id', 'صنف تجريبي بولي', 120.0, 1);
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('إضافة للجدول'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3498DB),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 4. جدول الأصناف
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: cart.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Center(
                              child: Text('لم يتم إضافة أصناف للفاتورة بعد',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16)),
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cart.length,
                            separatorBuilder: (_, __) =>
                                const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final item = cart[index];
                              return ListTile(
                                title: Text(item.productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    'الكمية: ${item.quantity}  |  سعر الوحدة: ${item.unitPrice} ج.م'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('${item.total} ج.م',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.green)),
                                    const SizedBox(width: 15),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline,
                                          color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          cart.removeAt(index);
                                          _calculateTotals();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 20),

                  // 5. الإجماليات والحفظ
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('الإجمالي: $subTotal ج.م',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Text('خصم %: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 80,
                                    child: TextField(
                                      controller: discountController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (_) => _calculateTotals(),
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('الصافي: $grandTotal ج.م',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Text('المدفوع: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 110,
                                    child: TextField(
                                      controller: paidController,
                                      keyboardType: TextInputType.number,
                                      onChanged: (_) => _calculateTotals(),
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8)),
                                    ),
                                  ),
                                ],
                              ),
                              Text('المتبقي: $remainingAmount ج.م',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed:
                                  (state is SalesLoadingState || cart.isEmpty)
                                      ? null
                                      : () {
                                          final invoice = SaleInvoiceEntity(
                                            contactId: selectedContactId.isEmpty
                                                ? 'dummy_id'
                                                : selectedContactId,
                                            contactName: selectedContactName,
                                            mode: currentMode,
                                            date: DateTime.now(),
                                            city: cityController.text,
                                            lineName: '',
                                            items: cart,
                                            subTotal: subTotal,
                                            invoiceDiscountPercent:
                                                invoiceDiscountPercent,
                                            grandTotal: grandTotal,
                                            paidAmount: paidAmount,
                                            remainingAmount: remainingAmount,
                                          );
                                          context
                                              .read<SalesCubit>()
                                              .createInvoice(invoice);
                                        },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2ECC71),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: state is SalesLoadingState
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text('حفظ وإتمام عملية البيع ✅',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTab(String title, String mode, IconData icon) {
    final isActive = currentMode == mode;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            currentMode = mode;
            cart.clear();
            _calculateTotals();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF3498DB) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: isActive ? Colors.white : Colors.grey.shade700,
                  size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
