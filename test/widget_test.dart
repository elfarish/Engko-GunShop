// flutter_test sudah dipasang otomatis saat membuat project
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gunshop/screens/home_page.dart'; // sesuaikan path

void main() {
  testWidgets('HomePage renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(), // dibungkus MaterialApp supaya theme tersedia
      ),
    );

    // contoh pengecekan sederhana
    expect(find.text('Engko GunShop'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });
}
