class Product {
  final String name;
  final int price;
  final String image;
  final String description;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

const List<Product> dummyProducts = [
  Product(
    name: 'Senapan',
    price: 1500000,
    image: 'assets/images/logo.png',
    description: 'Senapan angin berkualitas tinggi.',
  ),
  Product(
    name: 'Pistol Mainan',
    price: 750000,
    image: 'assets/images/logo.png',
    description: 'Pistol mainan aman untuk anak-anak.',
  ),
  Product(
    name: 'Peluru Mainan',
    price: 50000,
    image: 'assets/images/logo.png',
    description: 'Peluru mainan universal.',
  ),
  Product(
    name: 'Kacamata Pelindung',
    price: 120000,
    image: 'assets/images/logo.png',
    description: 'Melindungi mata saat latihan.',
  ),
  Product(
    name: 'Sarung Tangan',
    price: 85000,
    image: 'assets/images/logo.png',
    description: 'Sarung tangan outdoor.',
  ),
];
