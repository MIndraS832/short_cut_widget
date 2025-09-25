import 'package:flutter/material.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR")),
      body: const Center(child: Text("Halaman Scan QR")),
    );
  }
}
