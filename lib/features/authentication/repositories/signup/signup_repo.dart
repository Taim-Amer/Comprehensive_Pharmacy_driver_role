import 'package:comprehensive_pharmacy_driver_role/features/authentication/models/code_verification_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/authentication/models/resend_otp_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/authentication/models/signup_model.dart';

abstract class SignupRepo {
  Future<SignupModel> signup({
    required String driverName,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    required double lat,
    required double lng,
    required String fcmToken
  });

  Future<ResendOtpModel> resendOtp({required String phone});
}
