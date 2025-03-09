import 'package:comprehensive_pharmacy_driver_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_driver_role/features/authentication/controllers/forget_password_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyCodeButton extends StatelessWidget {
  const VerifyCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ForgetPasswordController.instance.forgetVerifyApiStatus.value == RequestState.loading ? const Center(child: LoadingWidget()): SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () => ForgetPasswordController.instance.forgetVerify(),
        child: Text(TranslationKey.kContinue),
      ),
    ));
  }
}
