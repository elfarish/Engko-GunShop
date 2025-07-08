import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/navigation.dart';
import 'screens/home_page.dart';
import 'screens/cart_page.dart';
import 'screens/product_detail_page.dart';
import 'screens/checkout_page.dart';
import 'models/product.dart';

void main() => runApp(const GunShopApp());

class GunShopApp extends StatelessWidget {
  const GunShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GunShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins', // font Poppins sudah aktif
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFaab99a),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashScreen(),
        '/main': (_) => const MainNavigation(),
        HomePage.route: (_) => const HomePage(),
        CartPage.route: (_) => const CartPage(),
        ProductDetailPage.route: (_) => const ProductDetailPage(),
        CheckoutPage.route: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as List<Map<Product, int>>;
          return CheckoutPage(items: args);
        },
      },
    );
  }
}
