import 'dart:async';
import 'package:fake_store/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(milliseconds: 1800), () {
      Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            // childCurrent: const SplashScreen(),
            child: HomeScreen(),
            inheritTheme: false,
            type: PageTransitionType.fade,
          ),
          (context) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Fake Store",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Version 1.0 : Year 2024",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            // IconButton(
            //   onPressed: () {
            //     LogOut().dialogue(context);
            //   },
            //   icon: const Icon(Icons.ac_unit),
            // ),
          ],
        ),
      ),
    );
  }
}
