import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class AuthService extends GetxController {
  static AuthService get instace => Get.find();

  var auth = FirebaseAuth.instance;
  var vid = ''.obs;

  Future<void> verifyPhone(String number) async {
    await auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential cred) async {
        await auth.signInWithCredential(cred);
      },
      verificationFailed: (e) {
        print(e);
      },
      codeSent: ((String verificationId, int? forceResendingToken) {
        vid.value = verificationId;
      }),
      codeAutoRetrievalTimeout: (verificationId) {
        vid.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      var pcred = PhoneAuthProvider.credential(verificationId: vid.value, smsCode: otp);
      var cred = await auth.signInWithCredential(pcred);

      return cred.user != null ? true : false;
    } catch (e) {
      return false;
    }
  }
}
