import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediapp/consts/consts.dart';
import 'package:mediapp/controllers/auth_controller.dart';
import 'package:mediapp/controllers/settings_controller.dart';
import 'package:mediapp/views/login_view/login_view.dart';

import '../../consts/lists.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.blueColor,
          title: AppStyle.bold(
              title: AppStrings.settings,
              color: AppColors.whiteColor,
              size: AppSizes.size18),
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(AppAssets.imgDoctor),
                  ),
                  title: AppStyle.bold(title: controller.username.value),
                  subtitle: AppStyle.normal(title: controller.email.value),
                ),
                const Divider(),
                20.heightBox,
                ListView(
                  shrinkWrap: true,
                  children: List.generate(
                      settingsList.length,
                      (index) => ListTile(
                            onTap: () async {
                              // print("hi: ${index}");

                              if (index == 2) {
                                print("hiiii: ${index}");
                                AuthController().signOut();
                                Get.offAll(() => const LoginView());
                              }
                            },
                            leading: Icon(
                              settingsListIcon[index],
                              color: AppColors.blueColor,
                            ),
                            title: AppStyle.bold(
                              title: settingsList[index],
                            ),
                          )),
                )
              ])));
  }
}
