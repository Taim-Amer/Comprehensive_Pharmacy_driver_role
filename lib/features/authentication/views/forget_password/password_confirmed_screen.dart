import 'package:comprehensive_pharmacy_driver_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_driver_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PasswordConfirmedScreen extends StatelessWidget {
  const PasswordConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(TImages.passwordConfirmed),
            Text(TranslationKey.kResetSuccess, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 18)),
            TSizes.sm.verticalSpace,
            Text(TranslationKey.kResetSuccessSubTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: const Color(0xFF989898))),
            TSizes.spaceBtwItems.verticalSpace,
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.signin),
                child: Text(TranslationKey.kLogin),
              ),
            )
          ],
        ),
      ),
    );
  }
}
