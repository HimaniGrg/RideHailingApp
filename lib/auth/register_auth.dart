import 'package:firebase_auth/firebase_auth.dart';

class RegisterAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Method for phone authentication
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      //handles the SMS code
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then(
              (value) => print('Logged In Successfully'),
            );
      },
      //handles exceptions
      verificationFailed: (FirebaseAuthException authException) {
        if (authException.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print(authException.message);
        }
      },
      //prompt user to enter the code
      codeSent: (String verificationId, int? resendToken) async {
        // wait for the user to enter the SMS code
        // for simplicity, we use a placeholder 'xxxx' in the codeSent callback.
        String smsCode = 'xxxxxx';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await _auth.signInWithCredential(credential);
      },
      //handle time out when automatic SMS code handling fails
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
