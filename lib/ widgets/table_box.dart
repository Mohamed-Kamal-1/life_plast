import 'package:flutter/material.dart';

class TableBox extends StatelessWidget {
  final Widget child;

  const TableBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
          )
        ],
      ),
      child: child,
    );
  }
}