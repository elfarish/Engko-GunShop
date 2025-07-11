import 'package:flutter/material.dart';
import 'package:gunshop/models/product.dart';
import 'package:gunshop/utils/currency_util.dart';
import 'package:gunshop/screens/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static const route = '/cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<Product, int>> _items;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Ambil argumen dan buat salinan agar bisa diubah
    _items =
        (ModalRoute.of(context)!.settings.arguments as List<Map<Product, int>>)
            .map((e) => {...e})
            .toList();
  }

  double get _total =>
      _items.fold(0, (sum, e) => sum + (e.keys.first.price * e.values.first));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: _items.isEmpty
          ? const Center(child: Text('Keranjang masih kosong'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (_, i) {
                      final product = _items[i].keys.first;
                      final qty = _items[i][product]!;
                      final totalPrice = product.price * qty;

                      return Dismissible(
                        key: ValueKey(product.name),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => setState(() => _items.removeAt(i)),
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: ListTile(
                          leading: Image.asset(product.image, width: 50),
                          title: Text(product.name),
                          subtitle: Text('Qty: $qty'),
                          trailing: Text(
                            formatUSD(totalPrice),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                _CartFooter(total: _total),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.green.shade700,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _items.isEmpty
                          ? null
                          : () async {
                              final result = await Navigator.pushNamed(
                                context,
                                CheckoutPage.route,
                                arguments: _items,
                              );

                              if (!mounted)
                                return; // pastikan widget masih aktif

                              if (result == true) {
                                setState(() {
                                  _items.clear(); // Kosongkan keranjang
                                });
                              }
                            },

                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _CartFooter extends StatelessWidget {
  final double total;
  const _CartFooter({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            formatUSD(total),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
