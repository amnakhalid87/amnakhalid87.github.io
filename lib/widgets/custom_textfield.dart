import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.isMobile,
    required this.label,
    required this.hintText,
    this.maxLines = 1,
  });
  final String label;
  final String hintText;
  final bool isMobile;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 16 : 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 15 : 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: isMobile ? 10 : 20),
          TextField(
            maxLines: maxLines,
            style: TextStyle(color: Colors.white, fontSize: isMobile ? 14 : 16),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: isMobile ? 13 : 15,
              ),
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
                borderSide: BorderSide(color: Colors.white24, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
                borderSide: BorderSide(color: Colors.white24, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(isMobile ? 12 : 8),
                borderSide: BorderSide(color: Colors.amber, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: isMobile ? 14 : 16,
                vertical: isMobile ? 14 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
