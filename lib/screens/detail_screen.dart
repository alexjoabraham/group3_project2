import 'package:flutter/material.dart';
import 'package:group3_project2/models/product.dart';
import 'package:group3_project2/providers/provider.dart';
import 'package:group3_project2/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF003B72),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200.0, // Adjust this value to control the image height
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003B72),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003B72),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  product.longDesc,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center, // Optional: centers the text
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product.name} added to cart!'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003B72),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Add to Cart'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003B72),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('View Cart'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}