import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'stat_card.dart';

class ResponsiveStatsGrid extends StatelessWidget {
  const ResponsiveStatsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> statCards = const [
      StatCard(title: "قيمة المخزون", value: "0.00 ج.م", icon: FontAwesomeIcons.boxesStacked, iconColor: Colors.blueGrey),
      StatCard(title: "إجمالي المبيعات", value: "0", icon: FontAwesomeIcons.chartLine, iconColor: Colors.green),
      StatCard(title: "إرجاعات المبيعات", value: "0", icon: Icons.remove_shopping_cart_outlined, iconColor: Colors.orange),
      StatCard(title: "اجمالي مشتريات الشهر", value: "0", icon: Icons.forklift, iconColor: Colors.brown),
      StatCard(title: "إرجاعات مشتريات الشهر", value: "0", icon: FontAwesomeIcons.boxOpen, iconColor: Colors.teal),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(children: statCards.map((c) => Padding(padding: const EdgeInsets.only(bottom: 10), child: c)).toList());
        } else if (constraints.maxWidth < 1100) {
          return Wrap(
            spacing: 12, runSpacing: 12,
            textDirection: TextDirection.rtl,
            children: statCards.map((c) => SizedBox(width: (constraints.maxWidth - 12) / 2, child: c)).toList(),
          );
        } else {
          return Row(
            textDirection: TextDirection.rtl,
            children: statCards.map((c) => Expanded(child: Padding(padding: const EdgeInsets.only(left: 10), child: c))).toList(),
          );
        }
      },
    );
  }
}