import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/custom_textfield.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 20,
            vertical: 20,
          ),
          margin: EdgeInsets.symmetric(horizontal: isMobile ? 5 : 70),
          width: isMobile ? screenWidth / 1.1 : screenWidth / 1.5,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white60),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Get in Touch',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: isMobile ? 14 : 17,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 25 : 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 20 : 40),

              CustomTextField(
                isMobile: isMobile,
                label: 'Name',
                hintText: 'Enter your name',
              ),
              CustomTextField(
                isMobile: isMobile,
                label: 'Email',
                hintText: 'Enter your email',
              ),

              CustomTextField(
                isMobile: isMobile,
                label: 'Message',
                hintText: 'Enter your message',
              ),
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.amber.shade600,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 14 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
