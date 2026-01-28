import 'package:flutter/material.dart';
import 'package:portfolio_web/widgets/tech_stack_btn.dart';

class TechstackSection extends StatelessWidget {
  const TechstackSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              TechStackButton(
                isMobile: isMobile,
                label: 'Flutter',
                iconname: 'flutter',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Dart',
                iconname: 'dart',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Firebase',
                iconname: 'firebase',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Supabase',
                iconname: 'supabase',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Python',
                iconname: 'python',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Flask',
                iconname: 'flask',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Pandas',
                iconname: 'pandas',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Scikit-learn',
                iconname: 'scikit-learn',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'API Integration',
                iconname: 'api',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Hive',
                iconname: 'hive',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'GetX',
                iconname: 'getx',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Provider',
                iconname: 'provider',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'HTTP',
                iconname: 'http',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Postman',
                iconname: 'postman',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'MySQL',
                iconname: 'mysql',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'MVC Architecture',
                iconname: 'mvc',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Google Auth',
                iconname: 'google auth',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Responsive UI',
                iconname: 'responsive',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'PyCharm',
                iconname: 'pycharm',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Kaggle',
                iconname: 'kaggle',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Git',
                iconname: 'git',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'GitHub',
                iconname: 'github',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Vercel',
                iconname: 'vercel',
              ),
              TechStackButton(
                isMobile: isMobile,
                label: 'Render',
                iconname: 'render',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
