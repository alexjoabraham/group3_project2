import 'package:flutter/material.dart';
import 'package:group3_project2/models/product.dart';
import 'package:group3_project2/providers/provider.dart';
import 'package:provider/provider.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) {
                final cartItem = cart.items.values.toList()[index];
                return ListTile(
                  leading: Image.network(cartItem.product.image),
                  title: Text(cartItem.product.name),
                  subtitle: Text(
                      'Quantity: ${cartItem.quantity} - Fragrance: ${cartItem.product.fragrance}'),
                  trailing: Text(
                    '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}',
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding below the button
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the CheckoutScreen with the list of CartItems
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(cartItems: cart.items.values.toList()),
                  ),
                );
              },
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF003B72), // Primary blue color
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
