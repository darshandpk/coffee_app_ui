import 'package:flutter/material.dart';

class ProdDetailsScreen extends StatefulWidget {
  const ProdDetailsScreen({super.key});

  @override
  State<ProdDetailsScreen> createState() => _ProdDetailsScreenState();
}

class _ProdDetailsScreenState extends State<ProdDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Product Details Screen'),),
    );
  }
}
