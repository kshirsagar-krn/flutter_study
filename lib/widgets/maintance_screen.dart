import 'package:fake_store/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../utils/custom_button.dart';
import '../utils/theme.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //     statusBarIconBrightness: Brightness.dark,
      //     statusBarColor: Colors.transparent,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                Assets.jsonsMaintenance,
                // Make sure to add your Lottie file in assets
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "We are under maintenance",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: primaryText,
                    ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Our app is currently undergoing scheduled\nmaintenance. Please check back later.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: secondaryText, height: 1.6),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                bckColor: Colors.red,
                buttonText: "Exit App",
                // buttonRadius: 40,
                width: 260,
                onClick: () {
                  SystemNavigator.pop();
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
