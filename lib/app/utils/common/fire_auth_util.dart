import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tektok/app/main/app_route.dart';
import 'package:tektok/app/utils/common/logger_util.dart';
import 'package:tektok/presentation/components/customs/custom_alert.dart';

class FireAuthUtil {
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    phoneNumber = "+62 " + phoneNumber.toString().trim();

    logger.safeLog('PHONE NUMBER : $phoneNumber');

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        logger.safeLog('credential : ${credential.smsCode}');
        logger.safeLog('credential : ${credential.verificationId}');
        logger.safeLog('credential : ${credential.accessToken}');
        logger.safeLog('credential : ${credential.providerId}');
        logger.safeLog('credential : ${credential.signInMethod}');
        logger.safeLog('credential : ${credential.token}');
        login(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        alert.error('Error', 'Login Failed');
        // Verification failed
        logger.safeLog('FAILED : ${e}');
        logger.safeLog('FAILED : ${e.credential?.accessToken}');
        logger.safeLog('FAILED : ${e.credential?.providerId}');
        logger.safeLog('FAILED : ${e.credential?.signInMethod}');
        logger.safeLog('FAILED : ${e.credential?.token}');
        logger.safeLog('FAILED : ${e.email}');
        logger.safeLog('FAILED : ${e.phoneNumber}');
        logger.safeLog('FAILED : ${e.tenantId}');
        logger.safeLog('FAILED : ${e.code}');
        logger.safeLog('FAILED : ${e.message}');
        logger.safeLog('FAILED : ${e.plugin.codeUnits}');
      },
      codeSent: (String verificationId, int? resendToken) async {
        logger.safeLog('verificationId : $verificationId');
        logger.safeLog('resendToken    : $resendToken');
        submitOTP(verificationId, '123456');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        logger.safeLog('verificationId : $verificationId');
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> submitOTP(String verificationId, String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    login(credential);
  }

  Future<void> login(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.to(RouteName.homePage);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> checkUserAvailable() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }
}

FireAuthUtil fireAuthUtil = FireAuthUtil();
