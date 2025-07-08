import 'package:intl/intl.dart';

String formatUSD(double price) {
  final formatter = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  return formatter.format(price);
}
