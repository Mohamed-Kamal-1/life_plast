import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_text/invoices_text/invoices_strings.dart';
import '../../../../core/di/di.dart';
import '../../../../core/dimensions/Dimension_app.dart';
import '../../../accounts/presentation/view_model/cubit/Account_Cubit.dart';
import '../../../inventory/domain/entities/product_entity.dart';
import '../../../inventory/presentation/cubit/inventory_cubit.dart';
import '../../domain/entities/invoice_entity.dart';
import '../../domain/entities/invoice_item_entity.dart';
import '../cubit/invoices_state.dart';
import '../cubit/nvoices_cubit.dart';
import '../widgets/invoice_footer.dart';
import '../widgets/invoice_header_selection.dart';
import '../widgets/invoice_items_list.dart';
import '../widgets/invoice_product_input.dart';

class CreateInvoiceScreen extends StatefulWidget {
  final String invoiceType;

  const CreateInvoiceScreen({
    super.key,
    required this.invoiceType,
  });

  @override
  State<CreateInvoiceScreen> createState() => _CreateInvoiceScreenState();
}

class _CreateInvoiceScreenState extends State<CreateInvoiceScreen> {
  String? _selectedAccountId;
  String? _selectedRepId;
  final List<InvoiceItemEntity> _invoiceItems = [];

  final _qtyController = TextEditingController();
  final _priceController = TextEditingController();
  ProductEntity? _currentSelectedProduct;

  double get _invoiceTotal =>
      _invoiceItems.fold(0, (sum, item) => sum + item.total);

  String _getScreenTitle() {
    switch (widget.invoiceType) {
      case 'sales':
        return InvoicesStrings.salesInvoice;
      case 'purchase':
        return InvoicesStrings.purchaseInvoice;
      case 'sales_return':
        return InvoicesStrings.salesReturn;
      case 'purchase_return':
        return InvoicesStrings.purchaseReturn;
      default:
        return 'فاتورة';
    }
  }

  void _addItem() {
    if (_currentSelectedProduct != null &&
        _qtyController.text.isNotEmpty &&
        _priceController.text.isNotEmpty) {
      setState(() {
        _invoiceItems.add(
          InvoiceItemEntity(
            productId: _currentSelectedProduct!.id,
            productName: _currentSelectedProduct!.name,
            quantity: int.parse(_qtyController.text),
            price: double.parse(_priceController.text),
          ),
        );
        _qtyController.clear();
        _priceController.clear();
        _currentSelectedProduct = null;
      });
    }
  }

  void _submitInvoice(BuildContext context) {
    if (_selectedAccountId == null ||
        _selectedRepId == null ||
        _invoiceItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(InvoicesStrings.emptyItems),
            backgroundColor: Colors.orange),
      );
      return;
    }

    final invoice = InvoiceEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: widget.invoiceType,
      accountId: _selectedAccountId!,
      repId: _selectedRepId!,
      date: DateTime.now().toIso8601String(),
      total: _invoiceTotal,
      items: _invoiceItems,
    );

    context.read<InvoicesCubit>().saveInvoice(invoice);
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountType =
        (widget.invoiceType == 'sales' || widget.invoiceType == 'sales_return')
            ? 'customer'
            : 'supplier';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<InvoicesCubit>()),
        BlocProvider(
            create: (context) =>
                getIt.get<AccountCubit>()..fetchAccounts(accountType)),
        BlocProvider(
            create: (context) =>
                getIt.get<AccountCubit>()..fetchAccounts('representative')),
        BlocProvider(
            create: (context) => getIt<InventoryCubit>()..fetchProducts()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(_getScreenTitle())),
        body: BlocConsumer<InvoicesCubit, InvoicesState>(
          listener: (context, state) {
            if (state is InvoicesSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(InvoicesStrings.successSave),
                    backgroundColor: Colors.green),
              );
              setState(() {
                _invoiceItems.clear();
                _selectedAccountId = null;
                _selectedRepId = null;
              });
            } else if (state is InvoicesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.message), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state is InvoicesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(Dimension.padding20),
              child: Column(
                children: [
                  InvoiceHeaderSelection(
                    accountType: accountType,
                    selectedAccountId: _selectedAccountId,
                    selectedRepId: _selectedRepId,
                    onAccountChanged: (val) =>
                        setState(() => _selectedAccountId = val),
                    onRepChanged: (val) => setState(() => _selectedRepId = val),
                  ),
                  const SizedBox(height: Dimension.heightSizeBox20),
                  InvoiceProductInput(
                    currentSelectedProduct: _currentSelectedProduct,
                    qtyController: _qtyController,
                    priceController: _priceController,
                    onProductChanged: (val) {
                      setState(() {
                        _currentSelectedProduct = val;
                        if (val != null) {
                          _priceController.text = (widget.invoiceType == 'sales'
                                  ? val.sellingPrice
                                  : val.buyingPrice)
                              .toString();
                        }
                      });
                    },
                    onAddPressed: _addItem,
                  ),
                  const SizedBox(height: Dimension.heightSizeBox20),
                  Expanded(
                    child: InvoiceItemsList(items: _invoiceItems),
                  ),
                  const SizedBox(height: Dimension.heightSizeBox20),
                  InvoiceFooter(
                    total: _invoiceTotal,
                    onSubmit: () => _submitInvoice(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
