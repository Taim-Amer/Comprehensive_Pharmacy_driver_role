import 'package:comprehensive_pharmacy_driver_role/features/authentication/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
  }
}