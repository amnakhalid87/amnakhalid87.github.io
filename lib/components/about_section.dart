import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_web/widgets/social_btn.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Column(
      children: [
        Center(
          child: Text(
            'Hey there, I\'m-',
            style: TextStyle(
              color: Colors.amber,
              fontSize: isMobile ? 20 : 28,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 1 : 5),
        Center(
          child: Text(
            'Amna Khalid',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 45 : 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 5 : 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
          child: Text(
            'Passionate Flutter Developer turning ideas into real-world solutions. With expertise in cross-platform development, I specialize in building responsive, scalable, and modern applications. My focus is on creating seamless digital experiences that combine elegant UI design with smooth performance across all devices.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: isMobile ? 12 : 18,
            ),
          ),
        ),
        SizedBox(height: isMobile ? 20 : 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButtons(
              isMobile: isMobile,
              label: 'GitHub',
              icon: FontAwesomeIcons.github,
              url: 'https://github.com/amnakhalid87',
            ),
            const SizedBox(width: 12),
            SocialButtons(
              isMobile: isMobile,
              label: 'LinkedIn',
              icon: FontAwesomeIcons.linkedin,
              url: 'https://www.linkedin.com/in/amna-khalid-a04335397',
            ),
            const SizedBox(width: 12),
            SocialButtons(
              isMobile: isMobile,
              label: 'Email',
              icon: FontAwesomeIcons.envelope,
              url: 'mailto:amnakhalid8791@gmail.com',
            ),
          ],
        ),
      ],
    );
  }
}
