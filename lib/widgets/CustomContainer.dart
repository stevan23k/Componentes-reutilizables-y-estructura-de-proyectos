import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Gradient? gradient;
  final double borderRadius;

  const new({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.color,
    this.gradient,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? colors.surfaceContainerLow) : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: colors.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
