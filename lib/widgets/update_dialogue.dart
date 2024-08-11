import 'dart:developer';

import 'package:flutter/material.dart';

import '../utils/custom_button.dart';

class UpdateDialogue {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.upcoming,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "New Version Update",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "1. We'll keep an eye on your missions and coins while you're gone.\n2.And we will miss you a lot...",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 11,
                        height: 1.6,
                        fontWeight: FontWeight.w400,
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
                  buttonText: 'Update Now'.toUpperCase(),
                  textFontSize: 13,
                  bckColor: Colors.green,
                  width: double.infinity,
                  buttonType: ButtonType.fillButton,
                  buttonRadius: 4,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  buttonText: 'Do it later!',
                  textFontSize: 13,
                  width: double.infinity,
                  buttonType: ButtonType.outlineButton,
                  buttonRadius: 4,
                ),
              ],
            ),
          );
        });
  }
}
