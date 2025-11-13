import 'package:flutter/material.dart';

enum Product {
  dart('Dart', 'The best Object language', 'assets/w5_ex3/dart.png'),
  flutter('Flutter', 'The best mobile widget library', 'assets/w5_ex3/flutter.png'),
  firebase('Firebase', 'The best cloud database', 'assets/w5_ex3/firebase.png');

  final String title;
  final String description;
  final String imagePath;
  const Product(this.title, this.description, this.imagePath);
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(title: Text('Products')),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomProduct(product: Product.dart),
              SizedBox(height: 20),
              CustomProduct(product: Product.flutter),
              SizedBox(height: 20),
              CustomProduct(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomProduct extends StatelessWidget {
  final Product product;
  const CustomProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(product.imagePath, width: 100, height: 100),
            ),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
