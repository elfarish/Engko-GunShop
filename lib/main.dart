import 'package:flutter/material.dart';
import 'screens/cart_page.dart';
import 'screens/checkout_page.dart';
import 'screens/product_detail_page.dart';
import 'screens/login_page.dart'; // ✅ Import halaman login
import 'screens/register_page.dart'; // ✅ Import halaman daftar
import 'screens/navigation.dart';
import 'screens/splash_screen.dart';
import 'models/product.dart';

void main() => runApp(const GunShopApp());

class GunShopApp extends StatelessWidget {
  const GunShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GunShop',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        '/main': (context) => const MainNavigation(),
        CartPage.route: (context) => const CartPage(),
        CheckoutPage.route: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as List<Map<Product, int>>;
          return CheckoutPage(items: args);
        },
        ProductDetailPage.route: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
          final product = args['product'] as Product;
          final onAdd = args['onAdd'] as VoidCallback;
          return ProductDetailPage(product: product, onAdd: onAdd);
        },

        // ✅ Tambahkan route ini
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
