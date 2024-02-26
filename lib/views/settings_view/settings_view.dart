import 'package:flutter/material.dart';
import 'package:mediapp/consts/consts.dart';

import '../../consts/lists.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        title: AppStyle.bold(
            title: AppStrings.settings,
            color: AppColors.whiteColor,
            size: AppSizes.size18),
      ),
      body: Column(children: [
        ListTile(
          leading: CircleAvatar(
            child: Image.asset(AppAssets.imgDoctor),
          ),
          title: AppStyle.bold(title: "Username"),
          subtitle: AppStyle.normal(title: "user_email@gmail.com"),
        ),
        const Divider(),
        20.heightBox,
        ListView(
          shrinkWrap: true,
          children: List.generate(
              settingsList.length,
              (index) => ListTile(
                    onTap: () {},
                    leading: Icon(
                      settingsListIcon[index],
                      color: AppColors.blueColor,
                    ),
                    title: AppStyle.bold(
                      title: settingsList[index],
                    ),
                  )),
        )
      ]),
    );
  }
}
