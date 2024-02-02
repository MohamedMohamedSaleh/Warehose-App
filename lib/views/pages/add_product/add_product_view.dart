import 'package:flutter/material.dart';
import 'package:warehouse/views/pages/add_product/form_add_product.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "Add Product",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        ),
      ),
      body: const FormAddProduct(),
    );
  }
}
