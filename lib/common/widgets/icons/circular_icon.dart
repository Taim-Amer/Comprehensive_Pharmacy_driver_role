import 'package:comprehensive_pharmacy_driver_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.backgroundColor,
    this.color,
    this.onPressed,
    this.radius = 20, required this.showBorder,
  });

  final double? width, height, size;
  final double? radius;
  final Color? backgroundColor;
  final Color? color;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        border: Border.all(color: showBorder ? TColors.primary : Colors.transparent),
        color: backgroundColor ?? (dark ? TColors.black.withOpacity(.9) : TColors.white.withOpacity(.9)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
      ),
    );
  }
}
