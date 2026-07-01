import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final FaIconData icon;
  final bool isIconData;
  final IconData iconData;
  final Color iconColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    // required this.icon,
    required this.iconColor,
    this.icon = FontAwesomeIcons.gamepad,
    required this.isIconData,
    this.iconData = Icons.stop_screen_share_rounded,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: isMobile ? null : 95,
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
          color: const Color(0xFFFBFBF9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5)
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1))),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            // child: Icon(icon, color: iconColor, size: isMobile ? 20 : 24),
            child: isIconData
                ? Icon(iconData, color: iconColor, size: isMobile ? 20 : 24)
                : FaIcon(icon, color: iconColor, size: isMobile ? 20 : 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                        color: Colors.grey[600],
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
                Text(value,
                    style: GoogleFonts.cairo(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
