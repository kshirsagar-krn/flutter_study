import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'splash_screen.dart';
import 'widgets/maintance_screen.dart';
import 'widgets/network_screen.dart';

void main() {
  // await Init().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late InternetConnectionChecker _internetConnectionChecker;
  late StreamSubscription<InternetConnectionStatus> _listener;
  bool isActiveNet = false;

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  checkInternet() async {
    _internetConnectionChecker = InternetConnectionChecker();
    _listener = _internetConnectionChecker.onStatusChange.listen((status) {
      final isConnected = status == InternetConnectionStatus.connected;
      setState(() {
        isActiveNet = isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            if (!isActiveNet) const NetworkScreen(),
            // const MaintenanceScreen(),
          ],
        );
      },
    );
  }
}
