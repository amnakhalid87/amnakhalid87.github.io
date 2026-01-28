import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
    required this.isMobile,
    required this.label,
    required this.icon,
    required this.url,
  });

  final bool isMobile;
  final String label;
  final IconData icon;
  final String url;

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white38, width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 12 : 20,
            vertical: isMobile ? 6 : 10,
          ),
          child: Row(
            children: [
              FaIcon(icon, color: Colors.white, size: isMobile ? 12 : 18),
              SizedBox(width: isMobile ? 8 : 12),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 14 : 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
