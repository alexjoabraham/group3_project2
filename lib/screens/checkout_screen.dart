import 'package:flutter/material.dart';
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

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegExp = RegExp(r'^\d+$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    if (value.length != 10) {
      return 'Phone number should be 10 digits';
    }
    return null;
  }

  String? _validateZipCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your zip code';
    }
    final zipRegExp = RegExp(r'^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$');
    if (!zipRegExp.hasMatch(value)) {
      return 'Please enter a valid zip code (e.g., A1A 1A1)';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    final nameRegExp = RegExp(r'^[a-zA-Z]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Name should contain only letters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = widget.cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
    double tax = subtotal * 0.135;
    double shippingFee = 8.99;
    double total = subtotal + tax + shippingFee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF003B72),
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
                _buildAddressCard(),
                SizedBox(height: 16.0),
                _buildContactCard(),
                SizedBox(height: 16.0),
                _buildOrderSummaryCard(subtotal, tax, shippingFee, total),
                SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/thankyou');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003B72),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
                    ),
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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

  Widget _buildAddressCard() {
    return Card(
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
                color: Color(0xFF003B72),
              ),
            ),
            SizedBox(height: 16.0),
            // Vertical layout for First Name and Last Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Color(0xFF003B72)),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Color(0xFF003B72)),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateName,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
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
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
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
                  ].map((String state) {
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
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Zip Code',
                    labelStyle: TextStyle(color: Color(0xFF003B72)),
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateZipCode,
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
    );
  }

  Widget _buildContactCard() {
    return Card(
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
                color: Color(0xFF003B72),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Color(0xFF003B72)),
                border: OutlineInputBorder(),
              ),
              validator: _validateEmail,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Color(0xFF003B72)),
                border: OutlineInputBorder(),
              ),
              validator: _validatePhoneNumber,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummaryCard(double subtotal, double tax, double shippingFee, double total) {
    return Card(
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
                color: Color(0xFF003B72),
              ),
            ),
            SizedBox(height: 16.0),
            _buildOrderSummaryRow('Subtotal', subtotal),
            _buildOrderSummaryRow('Tax (13.5%)', tax),
            _buildOrderSummaryRow('Shipping Fee', shippingFee),
            SizedBox(height: 16.0),
            Divider(thickness: 2.0),
            SizedBox(height: 16.0),
            _buildOrderSummaryRow('Total', total, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummaryRow(String title, double value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Color(0xFF003B72),
          ),
        ),
        Text(
          '\$${value.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Color(0xFF003B72),
          ),
        ),
      ],
    );
  }
}
