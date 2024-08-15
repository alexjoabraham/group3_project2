import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Valentino', desc: 'Blackcurrant , Bourbon Vanilla', longDesc: 'This is a warm floral fragrance inspired by Roman street style and edgy haute couture. A trio of jasmine flowers and sparkling blackcurrant fuse with warm vanilla and rich woods to create a scent that captures the essence of modern femininity.', fragrance: 'Floral', price: 155.5, image: 'assets/images/Valentino Donna Born In Roma Eau de Parfum.webp'),
    Product(name: 'Kayali', desc: 'Vanilla Orchids, Amber Woods', longDesc: 'Captivate the senses with VANILLA 28, a masterpiece of refined and cultivated nuance. A time-honored union of creamy jasmine and rich Madagascan vanilla orchid draws out the sweet softness of Brazilian tonka. Beautifully balanced oriental notes of musk, amber, patchouli, and brown sugar form the distinguished wood base of this utterly sublime scent.', fragrance: 'Warm and Spicy', price: 187.99, image: 'assets/images/KAYALI VANILLA  28 Eau de Parfum.webp'),
    Product(name: 'Prada', desc: 'Grapefruit, Incense, Vanilla', longDesc: 'A sophisticated cologne for men that opens with an invigorating burst of grapefruit essence and is contrasted with vibrant incense and rich vanilla bean. The cologne is elevated by a cutting-edge molecule, AmberXtreme™, which boosts the ingredients’ intensity for a long-lasting and sensual trail.', fragrance: 'Earthy and Woody', price: 165.87, image: 'assets/images/Prada Luna Rossa Ocean Eau de Parfum.webp'),
    Product(name: 'Versace', desc: 'Ginger, Gardenia, Amber', longDesc: 'A fragrance for the true Versace woman. She’s effortlessly sexy, confident, and loves fashion, sumptuousness, and eccentricity. The fragrance is a magical perfume, sheer and sensual at the same time. A floral scent, it’s absolutely feminine, gentle, and leaves a lasting impression.', fragrance: 'Warm and Spicy', price: 146.89, image: 'assets/images/Versace Crystal Noir Eau de Toilette.webp'),
    Product(name: 'Burberry', desc: 'Dark Berries, Jasmine', longDesc: 'Burberry Her Eau de Parfum for women is an artful blend of berries elevated by spirited jasmine and violet and smoothed out with amber and musk. A multifaceted, magnetic fruity gourmand and the scent of freedom.', fragrance: 'Floral', price: 165.9, image: 'assets/images/BURBERRY Her Eau de Parfum.webp'),
    Product(name: 'Tom Ford', desc: 'Rare Oud Wood, Sandalwood', longDesc: 'A composition of exotic, smoky woods including rare oud, sandalwood, rosewood, eastern spices, and sensual amber revealing oud‘s rich and compelling power.', fragrance: 'Earthy and Woody', price: 380.78, image: 'assets/images/TOM FORD Oud Wood Eau de Parfum.webp'),
    Product(name: 'Armani', desc: 'Marine Notes, Cypress, Musk', longDesc: 'Acqua di Giò Profondo Eau de Parfum is a captivating fragrance with marine and green mandarin notes. A masculine blend of lavandin and rosemary combines with a base of cedarwood and patchouli for a lasting, enveloping scent.', fragrance: 'Earthy and Woody', price: 135.67, image: 'assets/images/Armani Beauty Acqua di Giò Profondo Eau de Parfum.webp'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop Now!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF003B72),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ProductCard(
                product: item,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/product_details',
                    arguments: item,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
