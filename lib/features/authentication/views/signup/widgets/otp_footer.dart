import 'package:comprehensive_pharmacy_driver_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class OtpFooter extends StatelessWidget {
  const OtpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(TranslationKey.kOtpQuastion),
          TextButton(onPressed: (){}, child: Text(TranslationKey.kResend))
        ],
      ),
    );
  }
}
