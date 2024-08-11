import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../generated/assets.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              Assets.jsonsNetworkIssue,
              width: size.width * 0.9,
              // height: size.height * 0.3,
              fit: BoxFit.fitWidth,
            ),
            Text(
              "Handling Network Issues",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "Implementing Effective Strategies for Reliable\nConnectivity and Error Handling",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
