import 'package:comprehensive_pharmacy_driver_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SettingsAppbar extends StatelessWidget {
  const SettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Iconsax.language_circle, color: dark ? TColors.light : const Color(0xFF383838), size: 24),
                TSizes.xs.horizontalSpace,
                Text(TranslationKey.kLanguages, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            Text(TranslationKey.kLanguageSelect, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.more_vert, color: dark ? TColors.light : const Color(0xFF383838)),
        ),
      ],
    );
  }
}
