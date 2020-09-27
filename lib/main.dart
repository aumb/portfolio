import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/portfolio_home_screen.dart';

void main() {
  runApp(Portfolio());
}

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mathiew Abbas | Front-end Developer',
      theme: AppTheme().themeData,
      home: PortfolioHomeScreen(),
    );
  }
}
