import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/res/components/custom_textfield.dart';
import 'package:mediapp/views/appointment_view/appointment_view.dart';
import 'package:mediapp/views/home/home_view.dart';
import 'package:mediapp/views/signup_view/signup_view.dart';

import '../../consts/images.dart';
import '../../res/components/custom_button.dart';
import '../home/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                CustomTextField(
                  hint: AppStrings.email,
                  textController: controller.emailController,
                ),
                10.heightBox,
                CustomTextField(
                  hint: AppStrings.password,
                  textController: controller.passwordController,
                ),
                20.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: AppStyle.normal(title: AppStrings.forgotpassword),
                ),
                10.heightBox,
                SwitchListTile(
                  value: isDoctor,
                  onChanged: (newValue) {
                    setState(() {
                      isDoctor = newValue;
                    });
                  },
                  title: "Sign in as a doctor".text.make(),
                ),
                20.heightBox,
                CustomButton(
                    buttonText: AppStrings.login,
                    onTap: () async {
                      await controller.loginUser();
                      if (controller.userCredential != null) {
                        if (isDoctor) {
                          Get.to(() => const AppointmentView());
                        } else {
                          Get.to(() => const Home());
                        }
                      }
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
