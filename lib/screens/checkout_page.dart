import 'package:flutter/material.dart';
import 'package:gunshop/models/product.dart';
import 'package:gunshop/utils/currency_util.dart';

class CheckoutPage extends StatelessWidget {
  static const route = '/checkout';

  final List<Map<Product, int>> items;

  const CheckoutPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final total = items.fold<double>(
      0,
      (sum, item) => sum + (item.keys.first.price * item.values.first),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final product = items[i].keys.first;
                  final qty = items[i][product]!;
                  final totalItem = product.price * qty;

                  return ListTile(
                    leading: Image.asset(product.image, width: 50),
                    title: Text(product.name),
                    subtitle: Text('Qty: $qty'),
                    trailing: Text(
                      formatUSD(totalItem.toDouble()),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  formatUSD(total),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Tampilkan pesan sukses
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout berhasil!')),
                  );
                  // Kembali ke halaman sebelumnya dengan mengirim hasil true
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Confirm Payment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
