import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  final List<Map<String, dynamic>> dummyNotif = const [
    {
      'title': 'Pesanan Diterima',
      'message': 'Pesanan kamu sudah kami terima dan sedang diproses.',
      'time': '1 jam yang lalu',
      'icon': Icons.check_circle,
      'color': Colors.green,
    },
    {
      'title': 'Promo Spesial!',
      'message': 'Dapatkan diskon 20% untuk semua produk hari ini.',
      'time': '3 jam yang lalu',
      'icon': Icons.local_offer,
      'color': Colors.orange,
    },
    {
      'title': 'Pengiriman Berhasil',
      'message': 'Pesanan kamu telah berhasil dikirim.',
      'time': 'Kemarin',
      'icon': Icons.local_shipping,
      'color': Colors.blue,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: dummyNotif.isEmpty
          ? const Center(child: Text('Belum ada notifikasi'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: dummyNotif.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final notif = dummyNotif[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: notif['color'],
                    child: Icon(notif['icon'], color: Colors.white),
                  ),
                  title: Text(notif['title']),
                  subtitle: Text(notif['message']),
                  trailing: Text(
                    notif['time'],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                );
              },
            ),
    );
  }
}
