import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/currency_util.dart';

class CheckoutPage extends StatelessWidget {
  static const route = '/checkout';

  final List<Map<Product, int>> items;

  const CheckoutPage({super.key, required this.items});

  int get total =>
      items.fold(0, (sum, e) => sum + (e.keys.first.price * e.values.first));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final product = items[i].keys.first;
                  final qty = items[i][product]!;
                  return ListTile(
                    leading: Image.asset(product.image, width: 50),
                    title: Text(product.name),
                    subtitle: Text('Qty: $qty'),
                    trailing: Text('Rp ${formatRupiah(product.price * qty)}'),
                  );
                },
              ),
            ),
            Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${formatRupiah(total)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Misal tampil dialog konfirmasi
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Konfirmasi Pembelian'),
                      content: const Text(
                        'Apakah Anda yakin ingin melakukan pembelian?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Batal'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Tindakan setelah checkout selesai
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Pembelian berhasil diproses!'),
                              ),
                            );
                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                            );
                          },
                          child: const Text('Ya'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
