import 'package:flutter/material.dart';
import 'package:ride_hailing_app/app_export.dart';
import 'package:ride_hailing_app/auth/register_auth.dart';

class OtpPageScreen extends StatefulWidget {
  const OtpPageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpPageScreen> createState() => _OtpPageScreenState();
}

class _OtpPageScreenState extends State<OtpPageScreen> {
  List<TextEditingController> otpControllers =
      List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  bool areTextFieldsFilled = false;

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'OTP Verification',
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Enter the OTP code received in your phone number.',
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          6, // length of OTP code
                          (index) => Container(
                                width: 50,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  controller: otpControllers[index],
                                  focusNode: focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                  maxLength: 1,
                                  style: theme.textTheme.bodyMedium,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    hintText: '0',
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20,
                                        color: Colors.grey.shade600),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty &&
                                        index < otpControllers.length - 1) {
                                      focusNodes[index + 1].requestFocus();
                                    }
                                    //check if all fields are filled
                                    areTextFieldsFilled = otpControllers.every(
                                        (controller) =>
                                            controller.text.isNotEmpty);
                                    setState(() {});
                                  },
                                  // onEditingComplete: () {
                                  //   //if user want to edit the code
                                  //   if (otpControllers[index].text.isEmpty &&
                                  //       index > 0) {
                                  //     focusNodes[index - 1].requestFocus();
                                  //   }
                                  // },
                                ),
                              )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: areTextFieldsFilled
                          ? () {
                              onTapSubmitOTP();
                            }
                          : null, //disable the button if not filled
                      child: Text('Submit OTP'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 45),
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapSubmitOTP() {
    //await widget.authOperation.signInWithPhoneNumber(enteredOtp, widget.verificationId);
    Navigator.pushNamed(context, AppRoutes.dashboardPageScreen);
  }
}
