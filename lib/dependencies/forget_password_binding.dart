import 'package:comprehensive_pharmacy_pharmacy_role/features/authentication/controllers/signin_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
  }
}