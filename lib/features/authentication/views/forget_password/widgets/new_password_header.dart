import 'package:comprehensive_pharmacy_driver_role/utils/helpers/exports.dart';
import 'package:flutter/material.dart';

class NewPasswordHeader extends StatelessWidget {
  const NewPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TEnglishTexts.setNewPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
        TSizes.sm.verticalSpace,
        Text(TEnglishTexts.setNewPasswordSubTitle, style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }
}
