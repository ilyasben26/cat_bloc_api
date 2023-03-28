import 'package:flutter/material.dart';

class TextSkeleton extends StatelessWidget {
  const TextSkeleton({super.key, this.height, this.width});

  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
