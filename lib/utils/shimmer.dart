import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, required this.child});

  final Widget child;
  static const shimmerColorBase = Color(0xFFEBEBF4);
  static const shimmerColorHighlight = Color(0xFFF4F4F4);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: shimmerColorBase,
      highlightColor: shimmerColorHighlight,
      child: child,
    );
  }
}
