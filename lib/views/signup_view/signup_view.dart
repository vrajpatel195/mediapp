import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/res/components/custom_textfield.dart';

import '../../consts/images.dart';
import '../../res/components/custom_button.dart';
import '../home/home.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  String? valueChoose;
  List listItem = ["Body", "Heart", "Ear", "Liver", "Lungs", "Kidney"];
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
                CustomTextField(
                  hint: AppStrings.fullname,
                  textController: controller.fullnameController,
                ),
                10.heightBox,
                CustomTextField(
                  hint: AppStrings.email,
                  textController: controller.emailController,
                ),
                10.heightBox,
                CustomTextField(
                  hint: AppStrings.password,
                  textController: controller.passwordController,
                ),
                10.heightBox,
                SwitchListTile(
                    title: "Sign up as Doctor".text.make(),
                    value: isDoctor,
                    onChanged: (newValue) {
                      setState(() {
                        isDoctor = newValue;
                      });
                    }),
                Visibility(
                  visible: isDoctor,
                  child: Column(
                    children: [
                      10.heightBox,
                      CustomTextField(
                        hint: "About",
                        textController: controller.aboutController,
                      ),
                      10.heightBox,
                      DropdownButtonFormField<String>(
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue ?? "";
                            controller.categoryController.text = newValue ?? "";
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: 'Choose Category',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                            )),
                            hintStyle: TextStyle(
                              color: Colors.black,
                            )),
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem ?? "Choose Category"),
                          );
                        }).toList(),
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Services",
                        textController: controller.servicesController,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Address",
                        textController: controller.addressController,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Phone Number",
                        textController: controller.phoneController,
                      ),
                      10.heightBox,
                      CustomTextField(
                        hint: "Timing",
                        textController: controller.timingController,
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                CustomButton(
                    buttonText: AppStrings.signup,
                    onTap: () async {
                      await controller.signupUser(isDoctor);
                      if (controller.userCredential != null) {
                        Get.offAll(() => const Home());
                      }
                    }),
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
