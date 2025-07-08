import 'package:intl/intl.dart';

/// Format angka → “1.500.000” (tanpa `Rp`)
String formatRupiah(num number) => NumberFormat.currency(
  locale: 'id_ID',
  symbol: '',
  decimalDigits: 0,
).format(number).trim();
