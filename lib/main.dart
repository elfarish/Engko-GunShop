import 'package:flutter/material.dart';
import 'screens/product_detail_page.dart';
import 'screens/home_page.dart';
import 'screens/cart_page.dart';
import 'screens/checkout_page.dart';
import 'screens/splash_screen.dart';
import 'screens/navigation.dart'; // misal main navigation
import 'models/product.dart';

void main() => runApp(const GunShopApp());

class GunShopApp extends StatelessWidget {
  const GunShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GunShop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/main': (_) => const MainNavigation(),
        HomePage.route: (_) => const HomePage(),
        CartPage.route: (_) => const CartPage(),
        CheckoutPage.route: (_) => const CheckoutPage(
          items: [],
        ), // dummy, akan diisi argument saat dipanggil
        ProductDetailPage.route: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          final product = args['product'] as Product;
          final onAdd = args['onAdd'] as VoidCallback;
          return ProductDetailPage(product: product, onAdd: onAdd);
        },
      },
    );
  }
}
