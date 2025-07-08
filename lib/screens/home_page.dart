import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../utils/currency_util.dart';
import 'cart_page.dart';
import 'product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _query = '';
  final List<Map<Product, int>> _cart = [];

  List<Product> get _filtered => _query.isEmpty
      ? dummyProducts
      : dummyProducts
            .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
            .toList();

  void _add(Product p) {
    setState(() {
      final idx = _cart.indexWhere((e) => e.keys.first == p);
      if (idx == -1) {
        _cart.add({p: 1});
      } else {
        _cart[idx][p] = _cart[idx][p]! + 1;
      }
    });
  }

  void _openCart() => Navigator.pushNamed(
    context,
    CartPage.route,
    arguments: _cart,
  ).then((_) => setState(() {}));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Engko GunShop'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (v) => setState(() => _query = v),
                    decoration: InputDecoration(
                      hintText: 'Cari produk...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      onPressed: _openCart,
                    ),
                    if (_cart.isNotEmpty)
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${_cart.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: _filtered.isEmpty
          ? const Center(child: Text('Produk tidak ditemukan'))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _filtered.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: .7,
              ),
              itemBuilder: (_, i) => _ProductCard(
                product: _filtered[i],
                onTap: () => Navigator.pushNamed(
                  context,
                  ProductDetailPage.route,
                  arguments: {
                    'product': _filtered[i],
                    'onAdd': () => _add(_filtered[i]),
                  },
                ),
              ),
            ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  const _ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'Rp ${formatRupiah(product.price)}',
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
