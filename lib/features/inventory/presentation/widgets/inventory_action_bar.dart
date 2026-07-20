import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/inventory_bloc.dart';
import '../bloc/inventory_event.dart';
import '../bloc/inventory_state.dart';

class InventoryActionBar extends StatelessWidget {
  final InventoryLoaded state;

  const InventoryActionBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'ابحث باسم الصنف أو الكود...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  context.read<InventoryBloc>().add(SearchProductsEvent(val));
                },
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 200,
              child: DropdownButtonFormField<String>(
                value: state.selectedCategoryId,
                decoration: const InputDecoration(labelText: 'تصفية حسب القسم'),
                items: [
                  const DropdownMenuItem(
                      value: 'all', child: Text('كل التصنيفات')),
                  ...state.categories.map((cat) =>
                      DropdownMenuItem(value: cat.id, child: Text(cat.name))),
                ],
                onChanged: (val) {
                  if (val != null) {
                    context
                        .read<InventoryBloc>()
                        .add(FilterByCategoryEvent(val));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
