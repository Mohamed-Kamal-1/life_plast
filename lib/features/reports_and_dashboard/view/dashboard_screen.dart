import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../core/app_text/reports_text/reports_screen_text.dart';
import '../../../core/dimensions/Dimension_app.dart';
import '../presentation/cubit/reports_cubit.dart';
import '../presentation/cubit/reports_state.dart';
import '../presentation/widgets/stat_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReportsCubit>()..loadStats(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ReportsStrings.dashboardTitle),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: ReportsStrings.refresh,
                  onPressed: () {
                    context.read<ReportsCubit>().loadStats();
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ReportsCubit, ReportsState>(
          builder: (context, state) {
            if (state is ReportsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReportsError) {
              return Center(child: Text(state.message));
            } else if (state is ReportsLoaded) {
              final stats = state.stats;
              return Padding(
                padding: const EdgeInsets.all(Dimension.padding20),
                child: GridView.count(
                  crossAxisCount:
                      MediaQuery.of(context).size.width > 800 ? 4 : 2,
                  crossAxisSpacing: Dimension.spacing20,
                  mainAxisSpacing: Dimension.spacing20,
                  childAspectRatio: 2.5,
                  children: [
                    StatCardWidget(
                      title: ReportsStrings.totalSales,
                      value:
                          '${stats.totalSales.toStringAsFixed(2)} ${ReportsStrings.currency}',
                      icon: Icons.trending_up,
                      color: Colors.green,
                    ),
                    StatCardWidget(
                      title: ReportsStrings.totalPurchases,
                      value:
                          '${stats.totalPurchases.toStringAsFixed(2)} ${ReportsStrings.currency}',
                      icon: Icons.shopping_cart,
                      color: Colors.orange,
                    ),
                    StatCardWidget(
                      title: ReportsStrings.inventoryValue,
                      value:
                          '${stats.inventoryValue.toStringAsFixed(2)} ${ReportsStrings.currency}',
                      icon: Icons.inventory_2,
                      color: Colors.blue,
                    ),
                    StatCardWidget(
                      title: ReportsStrings.customersCount,
                      value: stats.customersCount.toString(),
                      icon: Icons.people,
                      color: Colors.purple,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
