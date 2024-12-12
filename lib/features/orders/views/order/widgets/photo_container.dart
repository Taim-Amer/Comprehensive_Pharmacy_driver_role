import 'package:comprehensive_pharmacy_driver_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: TRoundedContainer(
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding:  const EdgeInsets.all(TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSizes.spaceBtwItems.verticalSpace,
              Text(TEnglishTexts.prescriptionPhoto, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
              TSizes.spaceBtwItems.verticalSpace,
              TRoundedContainer(
                height: 200.h,
                backgroundColor: dark ? TColors.dark : TColors.grey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(TImages.camera),
                      TSizes.sm.verticalSpace,
                      Text(TEnglishTexts.prescriptionPhoto, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
