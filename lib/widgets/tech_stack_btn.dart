import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TechStackButton extends StatelessWidget {
  const TechStackButton({
    super.key,
    required this.isMobile,
    required this.label,
    required this.iconname,
    this.iconColor,
    this.backgroundColor,
  });

  final bool isMobile;
  final String label;
  final String iconname;
  final Color? iconColor;
  final Color? backgroundColor;

  IconData _getIcon() {
    switch (iconname.toLowerCase()) {
      case 'flutter':
        return FontAwesomeIcons.mobile;
      case 'dart':
        return FontAwesomeIcons.code;
      case 'firebase':
        return FontAwesomeIcons.fire;
      case 'supabase':
        return FontAwesomeIcons.database;
      case 'hive':
        return FontAwesomeIcons.boxArchive;
      case 'getx':
        return FontAwesomeIcons.bolt;
      case 'provider':
        return FontAwesomeIcons.cubes;

      case 'html':
        return FontAwesomeIcons.html5;
      case 'css':
        return FontAwesomeIcons.css3Alt;

      case 'python':
        return FontAwesomeIcons.python;
      case 'flask':
        return FontAwesomeIcons.server;
      case 'pandas':
        return FontAwesomeIcons.chartColumn;
      case 'scikit-learn':
        return FontAwesomeIcons.brain;
      case 'api':
      case 'api integration':
        return FontAwesomeIcons.plug;
      case 'http':
        return FontAwesomeIcons.globe;
      case 'postman':
        return FontAwesomeIcons.rocket;

      case 'mysql':
        return FontAwesomeIcons.database;

      case 'mvc':
      case 'mvc architecture':
        return FontAwesomeIcons.sitemap;

      case 'google auth':
      case 'google':
        return FontAwesomeIcons.google;

      case 'pycharm':
        return FontAwesomeIcons.laptopCode;
      case 'kaggle':
        return FontAwesomeIcons.chartLine;
      case 'git':
        return FontAwesomeIcons.git;
      case 'github':
        return FontAwesomeIcons.github;
      case 'vercel':
        return FontAwesomeIcons.caretUp;
      case 'render':
        return FontAwesomeIcons.cloud;
      case 'responsive ui':
      case 'responsive':
        return FontAwesomeIcons.mobileScreen;

      default:
        return FontAwesomeIcons.code;
    }
  }

  Color _getIconColor() {
    if (iconColor != null) return iconColor!;

    switch (iconname.toLowerCase()) {
      case 'flutter':
        return Color(0xFF02569B);
      case 'dart':
        return Color(0xFF0175C2);
      case 'firebase':
        return Color(0xFFFFCA28);
      case 'supabase':
        return Color(0xFF3ECF8E);
      case 'hive':
        return Color(0xFFFFB300);
      case 'getx':
        return Color(0xFF8B5CF6);
      case 'provider':
        return Color(0xFF42A5F5);

      case 'python':
        return Color(0xFF3776AB);
      case 'flask':
        return Color(0xFFFFFFFF);
      case 'pandas':
        return Color.fromARGB(255, 44, 24, 156);
      case 'scikit-learn':
        return Color(0xFFF7931E);

      case 'mysql':
        return Color(0xFF4479A1);
      case 'pycharm':
        return Color(0xFF21D789);
      case 'kaggle':
        return Color(0xFF20BEFF);
      case 'git':
        return Color(0xFFF05032);
      case 'github':
        return Colors.white;
      case 'postman':
        return Color(0xFFFF6C37);
      case 'vercel':
        return Colors.white;
      case 'render':
        return Color(0xFF46E3B7);
      case 'google auth':
      case 'google':
        return Color(0xFF4285F4);
      case 'api':
      case 'api integration':
      case 'http':
        return Color(0xFF00D9FF);
      case 'mvc':
      case 'mvc architecture':
        return Color(0xFFFF6B6B);
      case 'responsive ui':
      case 'responsive':
        return Color(0xFF4CAF50);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.white24, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 14 : 20,
          vertical: isMobile ? 8 : 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              _getIcon(),
              color: _getIconColor(),
              size: isMobile ? 18 : 22,
            ),
            SizedBox(width: isMobile ? 8 : 12),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
