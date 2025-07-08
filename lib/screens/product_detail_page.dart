import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../utils/currency_util.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
  static const route = '/detail';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Product product = args['product'];
    final VoidCallback onAdd = args['onAdd'];

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(product.image, height: 200)),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${formatRupiah(product.price)}',
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(product.description),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                onAdd();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ditambahkan ke keranjang')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
