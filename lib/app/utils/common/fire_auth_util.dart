import 'package:firebase_auth/firebase_auth.dart';
import 'package:tektok/app/utils/common/logger_util.dart';

class FireAuthUtil {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve verification code
        // await _auth.signInWithCredential(credential);
        // await _auth.signInWithPhoneNumber(phoneNumber);

        logger.safeLog('credential : ${credential.smsCode}');
        logger.safeLog('credential : ${credential.verificationId}');
        logger.safeLog('credential : ${credential.accessToken}');
        logger.safeLog('credential : ${credential.providerId}');
        logger.safeLog('credential : ${credential.signInMethod}');
        logger.safeLog('credential : ${credential.token}');
      },
      verificationFailed: (FirebaseAuthException e) {
        // Verification failed
      },
      codeSent: (String verificationId, int? resendToken) async {
        logger.safeLog('verificationId : $verificationId');
        logger.safeLog('resendToken    : $resendToken');
        // Save the verification ID for future use
        // String smsCode = 'xxxxxx'; // Code input by the user
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(
        //   verificationId: verificationId,
        //   smsCode: smsCode,
        // );
        // // Sign the user in with the credential
        // await _auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        logger.safeLog('verificationId : $verificationId');
      },
      timeout: const Duration(seconds: 60),
    );
  }

  sendOTP(String phoneNumber) async {
    phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult result = await auth.signInWithPhoneNumber(
      '+62$phoneNumber',
    );
    logger.safeLog("OTP Sent to +62 $phoneNumber");
    return result;
  }

  authenticate(ConfirmationResult confirmationResult, String otp) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    userCredential.additionalUserInfo!.isNewUser
        ? logger.safeLog("Authentication Successful")
        : logger.safeLog("User already exists");
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}

FireAuthUtil fireAuthUtil = FireAuthUtil();
