import 'package:comprehensive_pharmacy_driver_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
              hintText: TEnglishTexts.password,
              prefixIcon: const Icon(Iconsax.lock),
              suffixIcon: const Icon(Iconsax.eye_slash, size: 22,)
          ),
        ),
        TSizes.spaceBtwInputField.verticalSpace,
        TextFormField(
          enableInteractiveSelection: false,
          cursorColor: TColors.primary,
          decoration: InputDecoration(
              hintText: TEnglishTexts.confirmPassword,
              prefixIcon: const Icon(Iconsax.location),
              suffixIcon: const Icon(Iconsax.eye_slash, size: 22,)
          ),
        ),
      ],
    );
  }
}
