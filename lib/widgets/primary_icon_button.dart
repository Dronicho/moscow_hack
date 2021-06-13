import 'package:flutter/material.dart';
import 'package:moscow/styles/colors.dart';

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.size,
      this.decorate = true})
      : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final double? size;
  final bool decorate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: !decorate ? secondaryWhite : null,
            borderRadius: BorderRadius.circular(12),
            gradient: decorate ? primaryGradient : null),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: size,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
