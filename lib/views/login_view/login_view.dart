import 'package:flutter/material.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/res/components/custom_textfield.dart';

import '../../consts/images.dart';
import '../../res/components/custom_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  AppAssets.imgDoctor,
                  width: 200,
                ),
                10.heightBox,
                AppStrings.welcomeBack.text.make(),
                AppStrings.weAreExcited.text.make(),
              ],
            ),
          ),
          Expanded(
              child: Form(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(hint: AppStrings.email),
              10.heightBox,
              CustomTextField(hint: AppStrings.password),
              20.heightBox,
              Align(
                alignment: Alignment.centerRight,
                child: AppStrings.forgotpassword.text.make(),
              ),
              20.heightBox,
              CustomButton(buttonText: AppStrings.login, onTap: () {}),
              20.heightBox,
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                AppStrings.dontHaveAccount.text.make(),
                8.widthBox,
                AppStrings.signup.text.make(),
              ])
            ],
          ))),
        ]),
      ),
    );
  }
}
