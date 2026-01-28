import 'package:flutter/material.dart';
import 'package:portfolio_web/views/home_view.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amna Khalid | Portfolio',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
