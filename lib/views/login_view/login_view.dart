import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/res/components/custom_textfield.dart';
import 'package:mediapp/views/home/home_view.dart';
import 'package:mediapp/views/signup_view/signup_view.dart';

import '../../consts/images.dart';
import '../../res/components/custom_button.dart';
import '../home/home.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  title: AppStrings.welcomeBack, size: AppSizes.size18),
              AppStyle.bold(title: AppStrings.weAreExcited),
            ],
          ),
          20.heightBox,
          Expanded(
              child: Form(
                  child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(hint: AppStrings.email),
                10.heightBox,
                CustomTextField(hint: AppStrings.password),
                20.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: AppStyle.normal(title: AppStrings.forgotpassword),
                ),
                20.heightBox,
                CustomButton(
                    buttonText: AppStrings.login,
                    onTap: () {
                      Get.to(() => const Home());
                    }),
                20.heightBox,
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AppStyle.normal(title: AppStrings.dontHaveAccount),
                  8.widthBox,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupView());
                    },
                    child: AppStyle.bold(title: AppStrings.signup),
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
