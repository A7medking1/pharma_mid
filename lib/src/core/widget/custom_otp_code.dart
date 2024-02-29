import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomOtpCode extends StatelessWidget {
  final TextEditingController? controller;


  const CustomOtpCode({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      appContext: context,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      autoDisposeControllers: false,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        inactiveFillColor: Colors.grey,
        inactiveColor: Colors.grey,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      enableActiveFill: true,
      controller: controller,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
    );
  }
}
