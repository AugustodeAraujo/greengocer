import 'package:flutter/material.dart';
import 'package:greengrocer/src/configs/custom_colors.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? CustomColors.customSwatchColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            category,
            style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : CustomColors.customContrastColor,
                fontWeight: FontWeight.bold,
                fontSize: isSelected ? 16 : 14),
          ),
        ),
      ),
    );
  }
}
