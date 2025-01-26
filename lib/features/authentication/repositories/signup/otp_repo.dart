import 'package:comprehensive_pharmacy_driver_role/features/authentication/models/code_verification_model.dart';

abstract class OtpRepo{
  Future<CodeVerificationModel> verifyCode({required String phone, required String otp});
}