import 'package:flutter/material.dart';
// import '../models/product.dart';
import 'package:group3_project2/models/product.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  CheckoutScreen({required this.cartItems});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _useAsBillingAddress = true;

  @override
  Widget build(BuildContext context) {
    double subtotal = widget.cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
    double tax = subtotal * 0.135;
    double shippingFee = 8.99;
    double total = subtotal + tax + shippingFee;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Color(0xFF003B72), // Primary blue color
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Delivery Address Section
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Address',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003B72), // Primary blue color
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(color: Color(0xFF003B72)),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(color: Color(0xFF003B72)),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Street Address',
                            labelStyle: TextStyle(color: Color(0xFF003B72)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your street address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Apt/Suite/Floor (Optional)',
                            labelStyle: TextStyle(color: Color(0xFF003B72)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'City',
                                  labelStyle: TextStyle(color: Color(0xFF003B72)),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your city';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'State',
                                  labelStyle: TextStyle(color: Color(0xFF003B72)),
                                  border: OutlineInputBorder(),
                                ),
                                items: [
                                  'Alberta',
                                  'British Columbia',
                                  'Manitoba',
                                  'New Brunswick',
                                  'Newfoundland and Labrador',
                                  'Northwest Territories',
                                  'Nova Scotia',
                                  'Nunavut',
                                  'Ontario',
                                  'Prince Edward Island',
                                  'Quebec',
                                  'Saskatchewan',
                                  'Yukon',
                                ]
                                    .map((String state) {
                                  return DropdownMenuItem<String>(
                                    value: state,
                                    child: Text(state),
                                  );
                                }).toList(),
                                onChanged: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your state';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Zip Code',
                                  labelStyle: TextStyle(color: Color(0xFF003B72)),
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your zip code';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        CheckboxListTile(
                          title: Text(
                            'Use as billing address',
                            style: TextStyle(color: Color(0xFF003B72)),
                          ),
                          value: _useAsBillingAddress,
                          onChanged: (bool? value) {
                            setState(() {
                              _useAsBillingAddress = value ?? true;
                            });
                          },
                          activeColor: Color(0xFF003B72),
                          checkColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),

                // Contact Info Section
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003B72), // Primary blue color
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Color(0xFF003B72)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Color(0xFF003B72)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),

                // Order Summary Section
                Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003B72), // Primary blue color
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ...widget.cartItems.map((item) {
                          return ListTile(
                            title: Text(item.product.name),
                            trailing: Text(
                              '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                            ),
                          );
                        }).toList(),
                        SizedBox(height: 16.0),
                        Divider(),
                        SizedBox(height: 8.0),
                        Text(
                          'Subtotal: \$${subtotal.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Tax (13.5%): \$${tax.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Shipping Fee: \$${shippingFee.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8.0),
                        Divider(),
                        SizedBox(height: 8.0),
                        Text(
                          'Total: \$${total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003B72), // Primary blue color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.pushNamed(context, '/thankyou');
                    }
                  },
                  child: Text('Place Order'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF003B72), // Primary blue color
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
