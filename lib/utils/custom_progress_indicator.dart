import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, this.isMini = false});

  final bool isMini;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: isMini ? 25 : null,
      width: isMini ? 25 : null,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
      ),
    );
  }
}
