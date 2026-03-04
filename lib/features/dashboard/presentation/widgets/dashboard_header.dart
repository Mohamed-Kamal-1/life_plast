import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: Colors.white,
      child: Row(
        children: [
          if (!isMobile) // شريط البحث يظهر في الديسكتوب والتابلت
            Container(
              width: 250, height: 40,
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
              child: const TextField(decoration: InputDecoration(hintText: "بحث...", prefixIcon: Icon(Icons.search), border: InputBorder.none)),
            ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("لايف بلاست للصناعات البلاستيكية", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: isMobile ? 14 : 16)),
              if (!isMobile) Text("2022-10-17", style: GoogleFonts.cairo(color: Colors.grey, fontSize: 11)),
            ],
          ),
          const SizedBox(width: 15),
          const CircleAvatar(backgroundColor: Color(0xFF457B9D), child: Icon(Icons.person, color: Colors.white)),
        ],
      ),
    );
  }
}