import 'package:flutter/material.dart';

/// =======================================================
///   DASHBOARD & CART  –  GUNSHOP
/// =======================================================

class GunShopDashboard extends StatefulWidget {
  const GunShopDashboard({super.key});

  @override
  State<GunShopDashboard> createState() => _GunShopDashboardState();
}

class _GunShopDashboardState extends State<GunShopDashboard> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  final List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Senapan Angin',
      'price': 1500000,
      'image': 'assets/images/product1.png',
    },
    {
      'name': 'Pistol Mainan',
      'price': 750000,
      'image': 'assets/images/product2.png',
    },
    {
      'name': 'Peluru Mainan',
      'price': 50000,
      'image': 'assets/images/product3.png',
    },
    {
      'name': 'Kacamata Pelindung',
      'price': 120000,
      'image': 'assets/images/product4.png',
    },
    {
      'name': 'Sarung Tangan',
      'price': 85000,
      'image': 'assets/images/product5.png',
    },
  ];

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get _filteredProducts {
    if (_searchQuery.isEmpty) return allProducts;
    return allProducts
        .where(
          (p) => p['name'].toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      _cartItems.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['name']} ditambahkan ke keranjang')),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> p) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  p['image'],
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[300],
                    height: 150,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(114, 125, 115, 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () => _addToCart(p),
                    tooltip: 'Tambah ke keranjang',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              p['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Rp ${p['price']}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildHome() {
    final bannerImages = [
      'assets/images/banner/banner1.png',
      'assets/images/banner/banner2.png',
    ];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // ------------------ Banner -------------------
          AspectRatio(
            aspectRatio: 16 / 6,
            child: PageView.builder(
              itemCount: bannerImages.length,
              controller: PageController(viewportFraction: 0.9),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(bannerImages[index], fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ------------------ Produk Grid -------------------
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(child: Text('Produk tidak ditemukan'))
                : GridView.builder(
                    itemCount: _filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.7,
                        ),
                    itemBuilder: (context, i) =>
                        _buildProductCard(_filteredProducts[i]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCart() => CartPage(
    cartItems: _cartItems,
    onRemove: (idx) => setState(() => _cartItems.removeAt(idx)),
  );

  Widget _buildProfile() =>
      const Center(child: Text('Halaman Profil belum tersedia'));

  @override
  Widget build(BuildContext context) {
    final titles = ['Home', 'Keranjang', 'Profil'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(170, 185, 154, 1),
        title: _selectedIndex == 0
            ? TextField(
                decoration: const InputDecoration(
                  hintText: 'Cari produk...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
                onChanged: (v) => setState(() => _searchQuery = v),
              )
            : Text(titles[_selectedIndex]),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [_buildHome(), _buildCart(), _buildProfile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(114, 125, 115, 1),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(114, 125, 115, 1),
        child: const Icon(Icons.shopping_cart),
        onPressed: () => setState(() => _selectedIndex = 1),
      ),
    );
  }
}

/// ===========================================================
///                    CART PAGE (dalam file sama)
/// ===========================================================

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final void Function(int) onRemove;

  const CartPage({super.key, required this.cartItems, required this.onRemove});

  double get _total =>
      cartItems.fold(0, (sum, item) => sum + (item['price'] as num));

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const Center(
        child: Text(
          'Keranjang masih kosong',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, i) {
              final item = cartItems[i];
              return Dismissible(
                key: ValueKey('${item['name']}_$i'),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.red,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  Future.delayed(const Duration(milliseconds: 300), () {
                    onRemove(i);
                  });
                },
                child: ListTile(
                  leading: Image.asset(
                    item['image'],
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported),
                  ),
                  title: Text(item['name']),
                  trailing: Text('Rp ${item['price']}'),
                ),
              );
            },
          ),
        ),
        Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Rp ${_total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(114, 125, 115, 1),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Checkout belum diimplementasi')),
              ),
              child: const Text('Checkout'),
            ),
          ),
        ),
      ],
    );
  }
}
