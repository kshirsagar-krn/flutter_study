import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/custom_button.dart';

class LogOut {
  dialogue(context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Already leaving?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "We'll keep an eye on your missions and coins while you're gone. And we will miss you a lot...",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 11,
                        height: 1.6,
                      ),
                ),
                //
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  onClick: () {
                    log("csscj");
                  },
                  buttonText: 'Yes, Log out',
                  textFontSize: 13,
                  bckColor: Colors.red,
                  width: double.infinity,
                  buttonType: ButtonType.fillButton,
                  buttonRadius: 4,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomButton(
                  onClick: () {},
                  buttonText: 'No, I am staying',
                  textFontSize: 13,
                  bckColor: Colors.red,
                  width: double.infinity,
                  buttonType: ButtonType.onlyText,
                  buttonRadius: 40,
                ),
              ],
            ),
          );
        });
  }
}
