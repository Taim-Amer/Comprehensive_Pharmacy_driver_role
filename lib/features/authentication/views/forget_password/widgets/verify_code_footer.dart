import 'package:comprehensive_pharmacy_driver_role/features/authentication/controllers/forget_password_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class VerifyCodeFooter extends StatelessWidget {
  const VerifyCodeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(TranslationKey.kCheckPhoneQuastion),
          TextButton(
            onPressed: () => ForgetPasswordController.instance.resend(),
            child: Text(TranslationKey.kResend),
          )
        ],
      ),
    );
  }
}
