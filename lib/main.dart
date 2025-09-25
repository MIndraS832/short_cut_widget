import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'scan_qr_page.dart';
import 'create_qr_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = MethodChannel("com.example.short_cut_widget/widget_channel");

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _setupMethodChannel();
  }

  void _setupMethodChannel() {
    platform.setMethodCallHandler((call) async {
      if (call.method == "openPage") {
        String action = call.arguments ?? "";
        if (action == "scan_qr") {
          navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => const ScanQrPage()),
          );
        } else if (action == "create_qr") {
          navigatorKey.currentState?.push(
            MaterialPageRoute(builder: (_) => const CreateQrPage()),
          );
        }
      }
    });
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Widget Demo',
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: const Center(
          child: Text("Tekan widget dari home screen untuk navigasi."),
        ),
      ),
    );
  }
}
