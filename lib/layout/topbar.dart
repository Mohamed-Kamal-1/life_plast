import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      child: Row(
        children: const [
          Text(
            'Accounting System',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text('Admin'),
        ],
      ),
    );
  }
}