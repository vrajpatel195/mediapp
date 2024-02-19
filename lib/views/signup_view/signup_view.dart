import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/res/components/custom_textfield.dart';

import '../../consts/images.dart';
import '../../res/components/custom_button.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80),
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.imgDoctor,
                width: 200,
              ),
              10.heightBox,
              AppStyle.bold(
                  title: AppStrings.signupNow,
                  size: AppSizes.size18,
                  alignment: TextAlign.center),
            ],
          ),
          30.heightBox,
          Expanded(
              child: Form(
                  child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(hint: AppStrings.fullname),
                10.heightBox,
                CustomTextField(hint: AppStrings.email),
                10.heightBox,
                CustomTextField(hint: AppStrings.password),
                20.heightBox,
                CustomButton(buttonText: AppStrings.signup, onTap: () {}),
                20.heightBox,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppStyle.normal(title: AppStrings.alreadyHaveAccount),
                  8.widthBox,
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppStyle.bold(title: AppStrings.login),
                  ),
                ])
              ],
            ),
          ))),
        ]),
      ),
    );
  }
}
